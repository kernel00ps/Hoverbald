extends Node2D

class_name Obstacle

signal hit_obstable

const MIN_HEIGHT: float = 32.0
const MAX_HEIGHT: float = 128.0

var upper_area_collision: CollisionShape2D
var middle_area_collision: CollisionShape2D
var lower_area_collision: CollisionShape2D

var upper_area_sprite: AnimatedSprite2D
var middle_area_sprite: AnimatedSprite2D
var lower_area_sprite: AnimatedSprite2D


func _ready() -> void:
	
	upper_area_collision = $UpperArea/CollisionShape2D
	middle_area_collision = $MiddleArea/CollisionShape2D
	lower_area_collision = $LowerArea/CollisionShape2D
	
	upper_area_sprite = $UpperArea/AnimatedSprite2D
	middle_area_sprite = $MiddleArea/AnimatedSprite2D
	lower_area_sprite = $LowerArea/AnimatedSprite2D
	
	#randomize_obstacle()
	
	upper_area_sprite.play("default")
	middle_area_sprite.play("default")
	lower_area_sprite.play("default")
	
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
	
func randomize_obstacle():
	var new_middle_height = randf_range(MIN_HEIGHT, MAX_HEIGHT)
	resize_middle_area(new_middle_height)

func resize_middle_area(new_height: float):
	var collision_shape = middle_area_collision.shape as RectangleShape2D
	collision_shape.extents.y = new_height / 2  # Half-height for the collision shape

	middle_area_sprite.scale.y = new_height / 16

	$UpperArea.position.y = $MiddleArea.position.y - new_height / 2 - 16
	$LowerArea.position.y = $MiddleArea.position.y + new_height / 2 + 16
