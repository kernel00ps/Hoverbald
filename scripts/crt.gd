extends CanvasLayer

var viewport_size: Vector2
var viewport_width: float
var viewport_height: float

func _ready() -> void:
	viewport_size = get_viewport().get_visible_rect().size
	viewport_width = viewport_size.x
	viewport_height = viewport_size.y
