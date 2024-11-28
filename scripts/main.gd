extends Node

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 1
var screen_size: Vector2i
var ground_height : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	
func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$Player.reset()
	
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
	$Player.moving = true
	# animacija?

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
