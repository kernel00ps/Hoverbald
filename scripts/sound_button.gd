extends Button

func _ready() -> void:
	text = "Sound:" + ("ON" if Globals.is_sound_on else "OFF")

func _on_pressed() -> void:
	text = "Sound:" + ("ON" if Globals.is_sound_on else "OFF")
