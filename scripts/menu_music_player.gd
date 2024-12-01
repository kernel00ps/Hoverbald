extends AudioStreamPlayer

const menu_music = preload("res://assets/sound/music/song_menu.wav")

func _play_menu_music(volume = 0.0):
	if stream == menu_music:
		return
	
	stream = menu_music
	play()

func _stop_menu_music(volume = 0.0):
	stop()
	stream = null
