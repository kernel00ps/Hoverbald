extends Node2D

@export var tile_map_atlas: Resource

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
	generate_floor(0,0 )
	
func _process(delta: float) -> void:
	
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	
	tracker += offset
	if tracker >= (tile_map_lower.get_used_rect().size.x - 50) * PIXEL_SIZE:
		tracker = 0
		tile_map_lower.position.x = initial_position
		tile_map_upper.position.x = initial_position
		
		
	tile_map_lower.position.x -= offset
	tile_map_upper.position.x -= offset
	
func generate_floor(from_x, to_x):
	var tile_map_layer = 0 
	var tile_map_cell_position = Vector2i(0,0) 
	var tile_data = tile_map_lower.get_cell_source_id(Vector2(0,0))
	
	print(tile_map_layer, tile_map_cell_position, tile_data)
	
	for x in range(from_x, to_x):
		if !tile_map_lower.has_tile(x, 0):  # Only place tiles if not already present
			pass
