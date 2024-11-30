extends CanvasLayer

func _ready() -> void:
	process_mode = PROCESS_MODE_WHEN_PAUSED
	self.hide()

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func game_over() -> void:
	get_tree().paused = true
	get_parent().play_gameover()
	self.show()
