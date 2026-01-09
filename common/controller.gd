extends Node

var player: Entity

var rotation_speed: float = 1.0/16

enum CameraRotationModes {
	PARTIAL,
	FREE
}

var rotation_mode: CameraRotationModes = CameraRotationModes.PARTIAL
var target_camera_rotation: Vector3

func _init() -> void:
	EntityManager.on_inited.connect(func(): player = EntityManager.entities.get("g_player"))

func _input(event: InputEvent) -> void:
	if EntityManager.inited:
		if player:
			if rotation_mode == CameraRotationModes.FREE:
				if event.is_action("TurnLeft"):
					target_camera_rotation.y += rotation_speed
				if event.is_action("TurnRight"):
					target_camera_rotation.y -= rotation_speed
					
			if rotation_mode == CameraRotationModes.PARTIAL:
				if event.is_action_pressed("TurnLeft"):
					target_camera_rotation.y += PI/4
				if event.is_action_pressed("TurnRight"):
					target_camera_rotation.y -= PI/4

func _process(delta: float) -> void:
	if EntityManager.inited:
		player.rotation = lerp(player.rotation, target_camera_rotation, 1.0/8)
