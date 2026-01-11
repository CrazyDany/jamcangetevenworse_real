class_name UI extends Control

@onready var ui: Control = $UI
@onready var loading_screen: Control = $LoadingScreen
@onready var stats_label: Label = $UI/StatsLabel

var player_stats_component: StatsComponent

func _init() -> void:
	EntityManager.on_inited.connect(on_inited)
	TimeManager.on_tick.connect(on_tick)
	
func on_inited() -> void:
	var player: Entity = EntityManager.entities.get("g_player")
	player_stats_component = player.get_components().get("StatsComponent")
	print(player_stats_component)

func on_tick(cur_tick: int) -> void:
	if player_stats_component and stats_label:
		stats_label.text = ""
		for stat_name in player_stats_component.stats.keys():
			var stat: BaseStat = player_stats_component.stats.get(stat_name)
			stats_label.text += stat_name + ": " + str(stat.cur_value) + "/" + str(stat.max_value)
			stats_label.text += "\n"
