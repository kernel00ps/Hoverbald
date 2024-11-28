extends Node2D

class_name Obstacle

signal hit_obstable

#ove dve funkcije su iste samo za lower i upper opstacle
func _on_upper_area_body_entered(body: Node2D) -> void:
	obstacle_hit()

func _on_lower_area_body_entered(body: Node2D) -> void:
	obstacle_hit()

func obstacle_hit() -> void:
	hit_obstable.emit()
