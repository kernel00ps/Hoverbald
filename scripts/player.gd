extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -10.0

func _ready() -> void:
	velocity = Vector2.ZERO
	position.x -= 50

func _physics_process(delta: float) -> void:

	velocity += get_gravity() * delta

	if Input.is_action_pressed("UP"):
		velocity.y += JUMP_VELOCITY
		
	if Input.is_action_pressed("DOWN"):
		velocity.y -= JUMP_VELOCITY / 2 
	
	var direction = Input.get_axis("LEFT", "RIGHT")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
