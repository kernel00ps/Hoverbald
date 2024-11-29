extends Area2D

class_name PickupEnergy

signal picked_up


func _on_body_entered(body: Node2D) -> void:
	emit_signal("picked_up")
	print("PICKED UP")
	queue_free()
