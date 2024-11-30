extends Area2D

class_name PickupEnergy

signal picked_up

const PIXEL_SIZE: int = 16

func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	var viewport_width = viewport_size.x
	var viewport_height = viewport_size.y
	var lower_y: int = (viewport_height / 2) - PIXEL_SIZE * 2
	var upper_y: int = -1 * (viewport_height / 2) + PIXEL_SIZE * 4
	position.x = viewport_width + Globals.OBSTACLE_DELAY
	position.y = randi_range(lower_y, upper_y)

func _process(delta: float) -> void:
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	position.x -= offset

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		emit_signal("picked_up")
		queue_free()
