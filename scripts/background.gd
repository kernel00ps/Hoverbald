extends Node2D

var tile_map_upper: TileMapLayer
var tile_map_lower: TileMapLayer
var viewport_size: Vector2
var viewport_width: float
var viewport_height: float
var tracker: float
var initial_position: float

const PIXEL_SIZE: float = 16

func _ready() -> void:
	tile_map_lower = get_node("TileMapLower")
	tile_map_upper = get_node("TileMapUpper")
	viewport_size = get_viewport().get_visible_rect().size
	viewport_width = viewport_size.x
	viewport_height = viewport_size.y
	tracker = 0.0
	initial_position = tile_map_lower.position.x
	print(tile_map_lower.get_used_rect().size.x)

func _process(delta: float) -> void:
	
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	
	tracker += offset
	if tracker >= (tile_map_lower.get_used_rect().size.x - 50) * PIXEL_SIZE:
		tracker = 0
		tile_map_lower.position.x = initial_position
		tile_map_upper.position.x = initial_position
		
		
	tile_map_lower.position.x -= offset
	tile_map_upper.position.x -= offset
