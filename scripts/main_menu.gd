extends Control

func _ready() -> void:
	if Globals.is_sound_on:
		MenuMusicPlayer._play_menu_music()
	if Globals.is_sound_on && Globals.play_menu_click_sound:
		$AudioStreamPlayer_click.play()
	$VBoxContainer/crt_button.text = "CRT:" + ("ON" if Globals.is_crt_on else "OFF")
	$CRT.visible = Globals.is_crt_on

	Globals.play_menu_click_sound = false
	$ShonjaButton.modulate = Color(1, 1, 1, 0)
	
func _on_play_button_pressed() -> void:
	if Globals.is_sound_on:
		MenuMusicPlayer._stop_menu_music()
		$AudioStreamPlayer_click.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_controls_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/controls_menu.tscn")

func _on_crt_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
	Globals.is_crt_on = not Globals.is_crt_on
	$VBoxContainer/crt_button.text = "CRT:" + ("ON" if Globals.is_crt_on else "OFF")
	$CRT.visible = Globals.is_crt_on
	
func _on_sound_button_pressed() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
	Globals.is_sound_on = not Globals.is_sound_on
	if Globals.is_sound_on:
		MenuMusicPlayer._play_menu_music()
	else:
		MenuMusicPlayer._stop_menu_music()
	
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
