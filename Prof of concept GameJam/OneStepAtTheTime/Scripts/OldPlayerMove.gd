extends CharacterBody2D


@export var speed : float = 300.0
@export var jump_velocity : float = -420.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
		
	else: 
		if was_in_air == true:
			land()
		
		was_in_air = false
	

	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		jump()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("ui_left", "ui_right", "up", "down")
	
	if direction.x != 0 and animated_sprite.animation != "fall":
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)


	move_and_slide()
	update_animation()
	update_facing_direction()



func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animated_sprite.play("falling")
		else:
			if direction.x != 0:
				animated_sprite.play("movement")
			
			else:
				animated_sprite.play("idle")
			

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

func jump():
	velocity.y = jump_velocity
	animated_sprite.play("jump")
	animation_locked = true
	
func land():
	animated_sprite.play("fall")
	animation_locked = true
	
func _on_animated_sprite_2d_animation_finished():
	if (animated_sprite.animation == "fall"):
		animation_locked = false
	elif (animated_sprite.animation == "jump"):
		animation_locked = false
	
