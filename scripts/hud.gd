extends CanvasLayer

var fuel_bar:ProgressBar
var health_bar:TextureProgressBar
var progress:Sprite2D
var time_label:Label
var bar_size
var minutes:int = 0
var seconds:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuel_bar = get_node("FuelBar")
	health_bar = get_node("TextureHealthBar")
	progress = get_node("FuelImages/Progress")
	time_label = get_node("Label")
	bar_size = progress.scale.x
	Globals.connect("damage_taken", _on_damage_taken)
	update()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	var value = Globals.current_fuel
	fuel_bar.value = value
	#print(value)
	if(value >= 0 && value <= Globals.MAX_FUEL):
		if(Globals.current_fuel + Globals.fuel_modifier > Globals.MAX_FUEL):
			Globals.current_fuel = Globals.MAX_FUEL
			progress.scale.x = 1
		elif(Globals.current_fuel + Globals.fuel_modifier < 0):
			Globals.current_fuel = 0
			progress.scale.x = 0
		else:
			Globals.current_fuel += Globals.fuel_modifier
			progress.scale.x += bar_size * Globals.fuel_modifier / 100
	Globals.fuel_modifier = Globals.DEPLETION_RATE
		
func _on_timer_timeout() -> void:
	seconds += 1
	if(seconds == 60):
		seconds = 0
		minutes += 1
	time_label.set_text(str(minutes, ":", str(seconds).pad_zeros(2)))

func _on_fuel_update_timer_timeout() -> void:
	update()
	
func _on_damage_taken() -> void:
	Globals.current_hp -= 1
	health_bar.value -= 1
	Globals.CHEAT_INVINCIBLE = true
	$InvincibilityTimer.start()

func _on_invincibility_timer_timeout() -> void:
	Globals.CHEAT_INVINCIBLE = false
