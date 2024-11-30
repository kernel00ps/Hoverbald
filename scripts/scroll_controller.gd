extends Node2D

func _process(delta: float) -> void:
	#position.x += Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	pass
	
func _ready() -> void:
	#ovo kako kamera ne bi otisla u shadow realm
	var camera: Camera2D = $Camera2D
	camera.zoom = Vector2(1,1)
