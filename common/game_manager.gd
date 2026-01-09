extends Node3D

var inited_enitites: Dictionary[String, Entity]

func _init() -> void:
	EntityManager.on_inited.connect(game_ready)
	
func game_ready() -> void:
	var ui: UI = $UI/UI
	ui.loading_screen.hide()
