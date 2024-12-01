extends Control

func _ready() -> void:
	if($CRT):
		$CRT.visible = Globals.is_crt_on
