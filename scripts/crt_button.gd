extends Button

func _ready() -> void:
	text = "CRT:" + ("ON" if Globals.is_crt_on else "OFF")

func _on_pressed() -> void:
	text = "CRT:" + ("ON" if Globals.is_crt_on else "OFF")
