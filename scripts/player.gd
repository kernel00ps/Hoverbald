extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -10.0

const ANIM_FWD_TRESHOLD = 25

func _ready() -> void:
	velocity = Vector2.ZERO
	position.x -= 50

func _physics_process(delta: float) -> void:

	velocity += get_gravity() * delta

	if Input.is_action_pressed("ESC"):
		get_parent().get_parent().player_esc()

	if Input.is_action_pressed("UP"):
		velocity.y += JUMP_VELOCITY
		
	if Input.is_action_pressed("DOWN"):
		velocity.y -= JUMP_VELOCITY / 2 
	
	var direction = Input.get_axis("LEFT", "RIGHT")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var anim_velocity = velocity
	if velocity.y < ANIM_FWD_TRESHOLD && velocity.y > -ANIM_FWD_TRESHOLD:
		anim_velocity.y = 0
	
	$AnimationTree.set("parameters/Flying/blend_position", anim_velocity.normalized())
	
	move_and_slide()
	
