extends Node

#Продолжительность одного тика в секундах
var tick_duration: float = 0.2
var tick_timer: Timer

var cur_tick: int = 0

func _ready() -> void:
	tick_timer = Timer.new()
	tick_timer.wait_time = tick_duration
	add_child(tick_timer)
	tick_timer.start()
	tick_timer.timeout.connect(tick)

signal on_tick(cur_tick: int)
func tick() -> void:
	cur_tick += 1
	on_tick.emit(cur_tick)
