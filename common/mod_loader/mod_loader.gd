extends Node

func load_mods_from_folder(folder_path: String) -> void:
	var full_path: String = "res://" + folder_path
	print("loading mods from " + full_path)
	var dir = DirAccess.open(full_path)
	for folder_name in dir.get_directories():
		var mod_path: String = full_path + "/" + folder_name
		
		var mod_main: Dictionary = JSON.parse_string(FileAccess.open(mod_path + "/main.json", FileAccess.READ).get_as_text())
		if mod_main:
			print("  -> " + mod_main.get("id") + " loaded")
		
