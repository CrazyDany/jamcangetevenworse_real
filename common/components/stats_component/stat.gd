class_name BaseStat extends Resource

@export var max_value: int = 10000
@export var min_value: int = 0
@export var cur_value: int = 10000:
	set(new_value):
		if new_value < min_value:
			on_min_value_reach.emit()
		if new_value > max_value:
			on_max_value_reach.emit()
		on_value_change.emit()
		
		cur_value = clamp(new_value, min_value, max_value)
@export var update_duration: int = 1
@export var decrease_value: int = 1
@export var dependencies: Array[StatDependence]

signal on_min_value_reach
signal on_max_value_reach
signal on_value_change
signal on_update_cycle
