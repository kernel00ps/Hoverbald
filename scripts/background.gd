extends Node2D

@export var tile_map_atlas: Resource
@export var spikes_scene: PackedScene

var tile_map_upper: TileMapLayer
var tile_map_lower: TileMapLayer
var viewport_size: Vector2
var viewport_width: float
var viewport_height: float
var tracker: float
var initial_position: float
var last_generated_cell_position_lower: Vector2
var last_generated_cell_position_upper: Vector2

var spikes_list: Node2D
var floor_height
var ceiling_height
var game_over_screen: CanvasLayer

const PIXEL_SIZE: float = 16
const GRID_WIDTH: int = 8
const TILE_SOURCE_ID = 0
const BUFFER: int = 30
const PERCENT_SPIKES: int = 20

func _ready() -> void:
	tile_map_lower = get_node("TileMapLower")
	tile_map_upper = get_node("TileMapUpper")
	spikes_list = get_node("Spikes")
	game_over_screen = get_parent().get_node("GameOver")
	viewport_size = get_viewport().get_visible_rect().size
	viewport_width = viewport_size.x
	viewport_height = viewport_size.y
	tracker = 0.0
	initial_position = tile_map_lower.position.x
	
	var start_x: int = -1 * (viewport_width /  (2 * PIXEL_SIZE)) - 1
	var lower_y: int = (viewport_height /  (2 * PIXEL_SIZE)) - 1
	var upper_y: int = -1 * (viewport_height /  (2 * PIXEL_SIZE)) + 2
	
	floor_height = (viewport_height / 2) - PIXEL_SIZE * 1.5
	ceiling_height= -1 * (viewport_height / 2) + PIXEL_SIZE * 3.5
	
	generate_floor(Vector2i(start_x, lower_y), BUFFER, true)
	generate_floor(Vector2i(start_x, upper_y), BUFFER, false)
	
func _process(delta: float) -> void:
	var offset: float = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	
	tile_map_lower.position.x -= offset
	tile_map_upper.position.x -= offset
	
	tracker += offset
	
	if tracker >= viewport_width / 2:
		tracker = 0
		generate_floor(last_generated_cell_position_lower, 20, true)
		generate_floor(last_generated_cell_position_upper, 20, false)

func generate_floor(start_cords: Vector2i, row_length: int, is_lower: bool):
	for i in row_length:
		var random_tile_id = randi() % GRID_WIDTH
		var atlas_cords = Vector2(random_tile_id, 0)
		
		var cords: Vector2i = Vector2i(start_cords.x + i, start_cords.y)
		tile_map_lower.set_cell(cords, TILE_SOURCE_ID, atlas_cords)
		if is_lower: 
			last_generated_cell_position_lower = cords
		else:
			last_generated_cell_position_upper = cords
	tracker += row_length
	generate_spikes(row_length)
	remove_offscreen_tiles()

func remove_offscreen_tiles():
	pass

#generates random amount of spikes on either the upper flow or the lower floor
func generate_spikes(row_length: int) -> void:
	var spikes_num = int(row_length * PERCENT_SPIKES / 100)
	
	for i in range(spikes_num):
		var is_lower = randi() % 2 == 0
		var random_position = randi() % row_length
		
		var spikes: Spikes = spikes_scene.instantiate()
		var cell_position: Vector2
		var height
		
		if is_lower:
			cell_position = last_generated_cell_position_lower
			height = floor_height
		else:
			spikes.rotation = PI
			cell_position = last_generated_cell_position_upper
			height = ceiling_height
		
		spikes.position = Vector2(
			(cell_position.x + random_position) * PIXEL_SIZE,
			height
		)
		
		spikes.spike_hit.connect(spike_hit)
		spikes_list.add_child(spikes)
	remove_offscreen_spikes()

func remove_offscreen_spikes() -> void:
	for spikes in spikes_list.get_children():
		if spikes.position.x < -Globals.OBSTACLE_DELAY:
			spikes.queue_free()

func spike_hit() -> void:
	if not Globals.CHEAT_INVINCIBLE:
		game_over_screen.game_over()
