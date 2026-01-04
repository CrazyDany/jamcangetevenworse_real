extends Control

var scene_for_load = "res://scenes/GameScene.tscn"

func _ready() -> void:
	print('loading')
	ResourceLoader.load_threaded_request(scene_for_load)
	
func _process(delta: float) -> void:
	var progress: Array = []
	ResourceLoader.load_threaded_get_status(scene_for_load, progress)
	
	if progress[0] == 1:
		print('loaded')
		var packed_scene = ResourceLoader.load_threaded_get(scene_for_load)
		
#		ModLoader
		ModLoader.load_mods_from_folder("mods")
		get_tree().change_scene_to_packed(packed_scene)
