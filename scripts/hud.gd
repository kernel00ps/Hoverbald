extends CanvasLayer

var fuel_bar:ProgressBar
var progress:Sprite2D
var bar_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuel_bar = get_node("FuelBar")
	progress = get_node("FuelImages/Progress")
	bar_size = progress.scale.x
	update()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update()

func update():
	var value = Globals.current_fuel * 100 / Globals.MAX_FUEL
	fuel_bar.value = value
	if(value > 0):
		Globals.current_fuel -= 0.05
		progress.scale.x -= bar_size * 0.05 / 100
