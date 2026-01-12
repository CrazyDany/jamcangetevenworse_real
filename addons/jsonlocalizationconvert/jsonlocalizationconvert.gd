@tool
extends EditorPlugin
var ui: Control

func _enable_plugin() -> void:
	var ui_scene: PackedScene = preload("res://addons/jsonlocalizationconvert/interface.tscn")
	ui = ui_scene.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UL, ui)
	
func _disable_plugin() -> void:
	remove_control_from_docks(ui)
	ui.queue_free()
