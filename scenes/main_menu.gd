extends Control

@onready var settings_window: Control = $SettingsWindow
@onready var lang_option_button: OptionButton = $SettingsWindow/Control/VBoxContainer/MarginContainer2/Control/HBoxContainer/LangOptionButton

func _ready() -> void:
	for local in TranslationServer.get_loaded_locales():
		print(local)
		lang_option_button.add_item(local)
	
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/GameScene.tscn")

func _on_settings_button_pressed() -> void:
	settings_window.show()
	
func _on_close_button_pressed() -> void:
	settings_window.hide()

func _on_lang_option_button_item_selected(index: int) -> void:
	TranslationServer.set_locale(lang_option_button.get_item_text(index))
