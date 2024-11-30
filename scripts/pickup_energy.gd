extends Area2D

class_name PickupEnergy

signal picked_up

func _process(delta: float) -> void:
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	position.x -= offset

func _on_body_entered(body: Node2D) -> void:
	emit_signal("picked_up")
	queue_free()
