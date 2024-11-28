extends Node2D

const CAMERA_MOTION_BASE_SPEED: float = 500
@export var camera_speed_modifier: float = 1

func _process(delta: float) -> void:
	position.x += CAMERA_MOTION_BASE_SPEED * camera_speed_modifier * delta

func _ready() -> void:
	#ovo kako kamera ne bi otisla u shadow realm
	var camera: Camera2D = $Camera2D
	camera.zoom = Vector2(2,2)
