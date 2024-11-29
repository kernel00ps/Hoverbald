extends Node2D

class_name Obstacle

signal hit_obstable

func _ready() -> void:
	$UpperArea/AnimatedSprite2D.play("default")
	$LowerArea/AnimatedSprite2D.play("default")
	$MiddleArea/AnimatedSprite2D.play("default")
	
func _process(delta: float) -> void:
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	position.x -= offset

#ove dve funkcije su iste samo za lower i upper opstacle
func _on_upper_area_body_entered(body: Node2D) -> void:
	obstacle_hit()

func _on_lower_area_body_entered(body: Node2D) -> void:
	obstacle_hit()

func _on_middle_area_body_entered(body: Node2D) -> void:
	obstacle_hit()

func obstacle_hit() -> void:
	hit_obstable.emit()
