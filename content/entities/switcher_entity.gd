extends Entity

func _ready() -> void:
	var interact_component: InteractComponent = get_components().get("InteractComponent")
	interact_component.on_area_mouse_click.connect(on_handle_area_mouse_click)
	
func on_handle_area_mouse_click(buttonMask: int) -> void:
	if buttonMask == 1:
		var lamp_entity: Entity = EntityManager.entities.get("g_lamp")
		lamp_entity.visible = !lamp_entity.visible
