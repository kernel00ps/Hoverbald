extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -10.0

func _ready() -> void:
	velocity = Vector2.ZERO
	position.x = -200

func _physics_process(delta: float) -> void:
	
	#velocity.x = Globals.CAMERA_MOTION_BASE_SPEED * Globals.camera_speed_modifier * delta
	velocity += get_gravity() * delta
	print(position.x)
	# Add the gravity.
	if Input.is_action_pressed("UP"):
		velocity.y += JUMP_VELOCITY
	move_and_slide()
	
