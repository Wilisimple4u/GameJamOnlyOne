extends CharacterBody2D



const SPEED = 150.0
const JUMP_VELOCITY = -300.0
# IF the character hits a triangular surface,
# which sends them just within range of being on top of another platforms collider,
# it can trigger another instant jump, the players negative (upward force) will increase more then normal.

	


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
