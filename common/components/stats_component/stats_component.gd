class_name StatsComponent extends Component

@export var stats: Dictionary[String, BaseStat]

func _ready() -> void:
	TimeManager.on_tick.connect(on_game_tick)
	
func on_game_tick(cur_tick: int) -> void:
	for stat_name in stats.keys():
		var stat:BaseStat = stats.get(stat_name)
		if cur_tick % stat.update_duration == 0:
			stat.cur_value -= stat.decrease_value
			
			for stat_dependence in stat.dependencies:
				var entity: Entity = EntityManager.entities.get(stat_dependence.entity_id)
				if entity:
					var entity_stats_component: StatsComponent = entity.get_components().get("StatsComponent")
					var stat_for_dependnce: BaseStat = entity_stats_component.stats.get(stat_dependence.stat_dependence)
					#print(stat_dependence.stat_dependence)
					if stat_for_dependnce:
						var dependence_curve: Curve = stat_dependence.dependence_curve
						stat.cur_value -= int(dependence_curve.sample(float(stat_for_dependnce.cur_value)))
						#print(dependence_curve.sample(float(stat_for_dependnce.cur_value)))
						
			stat.on_update_cycle.emit()
						
