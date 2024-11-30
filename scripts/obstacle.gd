extends Node2D

class_name Obstacle

signal hit_obstable

const MIN_HEIGHT: float = 32.0
const MAX_HEIGHT: float = 128.0
const PIXEL_SIZE: int = 16
const BASE_SCALE: float = 2.2


var upper_area_collision: CollisionShape2D
var middle_area_collision: CollisionShape2D
var lower_area_collision: CollisionShape2D

var upper_area_sprite: AnimatedSprite2D
var middle_area_sprite: AnimatedSprite2D
var lower_area_sprite: AnimatedSprite2D

var viewport_size: Vector2
var viewport_width: float
var viewport_height: float


func _ready() -> void:
	
	upper_area_collision = $UpperArea/CollisionShape2D
	middle_area_collision = $MiddleArea/CollisionShape2D
	lower_area_collision = $LowerArea/CollisionShape2D
	
	upper_area_sprite = $UpperArea/AnimatedSprite2D
	middle_area_sprite = $MiddleArea/AnimatedSprite2D
	lower_area_sprite = $LowerArea/AnimatedSprite2D
	
	viewport_size = get_viewport().get_visible_rect().size
	viewport_width = viewport_size.x
	viewport_height = viewport_size.y
	#ovde ide kuršlus 
	randomize_obstacle()
	#ovo ga stavi na desni kraj ekrana
	position.x = viewport_width + randi_range(Globals.OBSTACLE_DELAY - PIXEL_SIZE * 4, Globals.OBSTACLE_DELAY + PIXEL_SIZE * 4)
	
	upper_area_sprite.play("default")
	middle_area_sprite.play("default")
	lower_area_sprite.play("default")
	
func _process(delta: float) -> void:
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	position.x -= offset

#ove dve funkcije su iste samo za lower i upper opstacle
func _on_upper_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		obstacle_hit()

func _on_lower_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		obstacle_hit()

func _on_middle_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		obstacle_hit()

func obstacle_hit() -> void:
	hit_obstable.emit()
	
func randomize_obstacle():
	var new_middle_height = randf_range(MIN_HEIGHT, MAX_HEIGHT)
	resize_middle_area(new_middle_height)

func resize_middle_area(new_height: float):
	#ovo su donja i gornja granica ekrana da se ne bi overlapovalo
	#ovo za PIXEL_SIZE je kako bi preskocili pod i plafon
	var lower_y: int = (viewport_height / 2) - PIXEL_SIZE * 2
	var upper_y: int = -1 * (viewport_height / 2) + PIXEL_SIZE * 4
	
	#spawnovanje gornjeg i donjeg dela
	$UpperArea.position.y = randi_range(upper_y, -10)
	$LowerArea.position.y = randi_range(10, lower_y)
	
	var gap_height = $LowerArea.position.y - $UpperArea.position.y - PIXEL_SIZE * 2

	if gap_height < PIXEL_SIZE:
		gap_height = PIXEL_SIZE

	$MiddleArea.position.y = ($UpperArea.position.y + $LowerArea.position.y) / 2

	$MiddleArea.scale.y = gap_height / (PIXEL_SIZE * 2)
	
	#nekad je ovo toliko malo da samo mora da nema scale
	if $MiddleArea.scale.y < 0.001:
		$MiddleArea.scale.y = 1
