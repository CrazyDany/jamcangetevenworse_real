class_name InteractComponent extends Component

@export var interact_area: Area3D

func _ready() -> void:
	if interact_area:
		interact_area.input_event.connect(area_input)
		
signal on_area_input(event: InputEvent)

signal on_area_mouse_click(button_mask: int)
func area_input(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	on_area_input.emit(event)
	if event is InputEventMouse:
		if event.is_pressed():
			on_area_mouse_click.emit(event.button_mask)
			
