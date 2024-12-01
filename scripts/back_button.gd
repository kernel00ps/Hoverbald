extends Button

func _ready() -> void:
	if Globals.is_sound_on:
		$AudioStreamPlayer_click.play()
		
func _on_pressed() -> void:
	if Globals.is_sound_on:
		Globals.play_menu_click_sound = true
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
