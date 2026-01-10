extends Control

@onready var progress_label: Label = $Label

var main_menu_scene_path: String = "res://scenes/MainMenu.tscn"
var game_scene_path: String = "res://scenes/GameScene.tscn"

func load_mods_from_folder(folder_path: String) -> void:
	var full_path: String = "res://" + folder_path
	print("Загрузка модов из " + full_path)
	var dir = DirAccess.open(full_path)
	for folder_name in dir.get_directories():
		var mod_path: String = full_path + "/" + folder_name
		var mod_main: Dictionary = JSON.parse_string(FileAccess.open(mod_path + "/main.json", FileAccess.READ).get_as_text())
		if mod_main:
			progress_label.text = "Загрузка мода " + mod_main.get("id") + "..."
			var new_mod:Mod = Mod.new()
			new_mod.mod_id = mod_main.get("id")
			new_mod.mod_path = mod_path
			new_mod.mod_name = mod_main.get("name")
			ModdingManager.loaded_mods[new_mod.mod_id] = new_mod
			print("  -> " + mod_main.get("id") + " загружен")
		
func _ready() -> void:
#	ModLoader
	print("Загрузка модов")
	progress_label.text = "Загрузка модов..."
	load_mods_from_folder("mods")
	print(ModdingManager.loaded_mods)
	print("Моды загружены")
#	Переход к главному меню
	progress_label.text = "Загрузка сцен..."
	ResourceLoader.load_threaded_request(main_menu_scene_path)
	ResourceLoader.load_threaded_request(game_scene_path)
	
func _process(delta: float) -> void:
	var progress_menu: Array = []
	var progress_game: Array = []
	ResourceLoader.load_threaded_get_status(main_menu_scene_path, progress_menu)
	ResourceLoader.load_threaded_get_status(game_scene_path, progress_game)
	
	if (progress_menu[0] + progress_game[0]) == 2:
		print("Сцены загружены")
		progress_label.text = "Готово!"
		get_tree().change_scene_to_file(main_menu_scene_path)
