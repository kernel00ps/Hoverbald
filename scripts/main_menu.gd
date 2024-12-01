extends Control

func _ready() -> void:
	if Globals.is_sound_on && Globals.play_menu_click_sound:
		$AudioStreamPlayer_click.play()
	Globals.play_menu_click_sound = false
	$ShonjaButton.modulate = Color(1, 1, 1, 0)

func _on_play_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/controls_menu.tscn")

func _on_crt_button_pressed() -> void:
	Globals.is_crt_on = not Globals.is_crt_on

func _on_sound_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
	Globals.is_sound_on = not Globals.is_sound_on
	
func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits_menu.tscn")

func _on_quit_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
	get_tree().quit()

func _on_shonja_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_pickup.play()
	Globals.is_shonja = not Globals.is_shonja
