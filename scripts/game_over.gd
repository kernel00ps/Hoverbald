extends CanvasLayer

func _ready() -> void:
	process_mode = PROCESS_MODE_WHEN_PAUSED
	self.hide()

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	Globals.current_hp = Globals.MAX_HP
	Globals.current_fuel = Globals.MAX_FUEL
	Globals.CHEAT_INVINCIBLE = false
	
func game_over() -> void:
	Globals.camera_speed_modifier = 1
	Globals.CHEAT_INVINCIBLE = false
	Globals.current_hp = Globals.MAX_HP
	get_tree().paused = true
	get_parent().play_gameover()
	self.show()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	Globals.current_hp = Globals.MAX_HP
	Globals.current_fuel = Globals.MAX_FUEL
	Globals.CHEAT_INVINCIBLE = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
