extends Node2D

func _ready() -> void:
	
	#Getting the background widht dynamically so the parallax can repeat 
	var paralax: Parallax2D = get_node("Parallax2D")
	var background: Sprite2D = get_node("Parallax2D/Sprite2D")
	paralax.repeat_size.x = background.texture.get_width()
	paralax.repeat_times = 3
	
	#ovo sranje centrira paralex kako se ne bi jebo
	var viewport_size = get_viewport().get_visible_rect().size
	var viewport_width = viewport_size.x
	var viewport_height = viewport_size.y
	paralax.position.x = viewport_width / 2
	paralax.position.y = viewport_height / 2
	
