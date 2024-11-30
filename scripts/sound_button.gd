extends Button

var sound_enabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	sound_enabled = !sound_enabled
	text = "Sound:" + ("ON" if sound_enabled else "OFF")
	pass # Replace with function body.
