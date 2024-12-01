extends Node

@export var obstacle_scene : PackedScene
@export var pickup_energy_scene: PackedScene
@export var spikes_scene: PackedScene

const SCROLL_SPEED : int = 1
var viewport_size: Vector2
var viewport_width: float
var viewport_height: float
var ground_height : int

var obstacle_list: Node2D
var pickup_energy_list: Node2D

var game_over_screen: CanvasLayer 

func _ready() -> void:
	obstacle_list = get_node("Obstacles")
	pickup_energy_list = get_node("PickUpEnergies")
	viewport_size = get_viewport().get_visible_rect().size
	viewport_width = viewport_size.x
	viewport_height = viewport_size.y
	game_over_screen = get_node("GameOver")
	
	Globals.connect("end_game", _on_end_game)
	
	if Globals.is_sound_on:
		$AudioStreamPlayer_intro.play()
	if not Globals.is_crt_on:
		$CRT.get_child(0).hide()
	
func _input(event):
	pass

func generate_obstacles() -> void:
	remove_offscreen_obstacles()
	var obstacle: Obstacle = obstacle_scene.instantiate()
	obstacle.hit_obstacle.connect(player_hit_obstacle)
	obstacle_list.add_child(obstacle)
	 
func remove_offscreen_obstacles() -> void:
	for obstacle in obstacle_list.get_children():
		if obstacle.position.x < -Globals.OBSTACLE_DELAY:
			obstacle.queue_free()
	
func generate_pickup_energy() -> void:
	remove_offscreen_pickups()
	var pickup_energy: PickupEnergy = pickup_energy_scene.instantiate()
	pickup_energy.picked_up.connect(player_picked_up_energy)
	pickup_energy_list.add_child(pickup_energy)

func remove_offscreen_pickups() -> void:
	for pickup in pickup_energy_list.get_children():
		if pickup.position.x < -Globals.OBSTACLE_DELAY:
			pickup.queue_free()

func _on_obstacle_timer_timeout() -> void:
	generate_obstacles()
	pass

func player_hit_obstacle() -> void:
	if not Globals.CHEAT_INVINCIBLE:
		Globals.emit_signal("damage_taken")
		if(Globals.current_hp <= 0):
			game_over_screen.game_over()

func player_picked_up_energy() -> void:
	Globals.fuel_modifier = Globals.PICKUP_VALUE
	play_pickup()

func _on_energy_timer_timeout() -> void:
	generate_pickup_energy()
	
func play_gameover() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_gameover.play()        

func play_pickup() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_pickup.play()
	
func play_hurt() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_hurt.play()

func _on_audio_stream_player_intro_finished() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_music.play()

func _on_speed_up_timer_timeout() -> void:
	Globals.camera_speed_modifier += 10
	$ObstacleTimer.wait_time *= 0.95

func _on_end_game() -> void:
	game_over_screen.game_over()
