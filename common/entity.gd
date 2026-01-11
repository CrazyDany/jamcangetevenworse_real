class_name Entity extends Node3D

## Индетификатор сущности
@export var entity_id: String

## Возвращает словарь всех компонентов данной сущности
func get_components() -> Dictionary[String, Component]:
	var self_components: Dictionary[String, Component]
	for child_node in get_children():
		if child_node is Component:
			self_components[child_node.name] = child_node
			
	return self_components
	
## Возвращает компонент сущности по названию его ноды
func get_component(component_name: String) -> Component:
	return get_components().get(component_name)
	
func _init() -> void:
	EntityManager.add_entity(self)
