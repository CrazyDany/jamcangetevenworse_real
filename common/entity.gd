class_name Entity extends Node3D

@export var entity_id: String

func get_components() -> Array[Component]:
	var self_components: Array[Component]
	for child_node in get_children():
		if child_node is Component:
			self_components.append(child_node)
			
	return self_components

func _ready() -> void:
	if EntityManager.entities.has(self.entity_id):
		push_warning("Сущность с индитификатаром " + self.entity_id + " уже существует в EntityManager")
		return
		
	EntityManager.entities.get_or_add(self.entity_id, self)
	print("Сущность " + self.entity_id + " успешно добавлена в EntityManager")
