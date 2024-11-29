extends ProgressBar

@export var player:CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update()

func update():
	value = player.current_fuel * 100 / player.max_fuel
