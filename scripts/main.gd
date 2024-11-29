extends Node

@export var obstacle_scene : PackedScene

const OBSTACLE_DELAY: int = 100
const OBSTACLE_RANGE: int = 200

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 1
var screen_size: Vector2i
var ground_height : int

func _ready() -> void:
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	
func _input(event):
	#if(!game_over):
	#	if event is InputEventKey:
	#		if event.button_index == KEY_SPACE && event.pressed:
	#			if(!game_running):
	#				start_game()
				#else: <- za animaciju
				#	if $Player.moving:
	if(!game_over && Input.is_key_pressed(KEY_SPACE)):
		if(!game_running):
			start_game()
					
func start_game():
	game_running = true
	# animacija?

func _process(delta: float) -> void:
	pass

func generate_obstacles() -> void:
	var obstacle: Node = obstacle_scene.instantiate()
	obstacle.position.x = screen_size.x + OBSTACLE_DELAY

func _on_obstacle_timer_timeout() -> void:
	generate_obstacles()
