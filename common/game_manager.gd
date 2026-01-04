extends Node3D

@onready var cube: Entity = EntityManager.entities.get("g_cube")
@onready var lamp: Entity = EntityManager.entities.get("g_lamp")

func _ready() -> void:
	for component in cube.get_components():
		if component is InteractComponent:
			component.on_area_mouse_click.connect(_on_cube_click)
			
func _on_cube_click(mouse_mask: int) -> void:
	if mouse_mask == 1:
		lamp.visible = not lamp.visible
