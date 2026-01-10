extends Control

@onready var settings_window: Control = $SettingsWindow

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GameScene.tscn")

func _on_settings_button_pressed() -> void:
	settings_window.show()
	
func _on_close_button_pressed() -> void:
	settings_window.hide()
