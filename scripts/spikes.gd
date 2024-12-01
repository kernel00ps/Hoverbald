extends Area2D

class_name Spikes 

signal spike_hit

func _process(delta: float) -> void:
	var offset: float = (Globals.CAMERA_MOTION_BASE_SPEED + Globals.camera_speed_modifier) * delta
	position.x -= offset

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("spike_hit")
