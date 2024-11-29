extends CanvasLayer

var fuel_bar:ProgressBar
var progress:Sprite2D
var time_label:Label
var bar_size
var minutes:int = 0
var seconds:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuel_bar = get_node("FuelBar")
	progress = get_node("FuelImages/Progress")
	time_label = get_node("Label")
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

func _on_timer_timeout() -> void:
	seconds += 1
	if(seconds == 60):
		seconds = 0
		minutes += 1
	time_label.set_text(str(minutes, ":", str(seconds).pad_zeros(2)))
