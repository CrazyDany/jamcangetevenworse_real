extends Node

## Словарь всех сущностей. Заполняется в момент иницилизации
var entities: Dictionary[String, Entity]
## Список иницилизирующихся сущностей
var initializing_entities: Array[Entity]
## Отображает иницилизированны ли все сущности
var inited: bool = false
## Вызывается по окончанию иницилизации всех сущностей
signal on_inited

func add_entity(entity: Entity) -> void:
	if initializing_entities.has(entity):
		push_warning("Сущность с индитификатаром " + entity.entity_id + " уже существует в EntityManager")
		return
		
	initializing_entities.append(entity)
	entity.ready.connect(func(): on_entity_ready(entity))

func on_entity_ready(entity: Entity) -> void:
	initializing_entities.erase(entity)
	entities.get_or_add(entity.entity_id, entity)
	
	print("Сущность " + entity.entity_id + " успешно добавлена в EntityManager")
	
	if initializing_entities.is_empty():
		inited = true
		on_inited.emit()
		print("Иницилизация сущностей закончена")
