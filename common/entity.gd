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
	
func _init() -> void:
	EntityManager.add_entity(self)
