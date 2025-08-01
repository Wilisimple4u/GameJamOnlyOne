extends CharacterBody2D

#Importing and reading the platform to be used.
const PlayPlatform = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")
var Is_Platform = false

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
# IF the character hits a triangular surface,
# which sends them just within range of being on top of another platforms collider,
# it can trigger another instant jump, the players negative (upward force) will increase more then normal.


func _ready() -> void:
	Camera.global_position.y = 0

		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("W_and_Space_Key") and is_on_floor():
		velocity.y = (JUMP_VELOCITY)	
			
	#Move camera up with player	and camera difference
	if Camera.global_position.y > self.global_position.y:
		Camera.global_position.y = self.global_position.y
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("A_Key", "D_Key")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


	# Old code to prevent spawn of platforms on main menu, After making it not global it was fixed. Unneeded work around:
	# 'and get_tree().current_scene.name == "Node2D"'
	if Input.is_action_just_pressed("Mouse_LeftClick"):
		#print(Is_Platform)
		if is_on_floor() and Is_Platform == false:
			spawnplatform()

func remove_platform():
	for node in get_tree().get_nodes_in_group("platforms"):
		node.queue_free()

#Checks then deletes the previous playerplatform if it exists then creates a new playerplatform in the level scene.
func spawnplatform():
	remove_platform()
	var new_Platform = PlayPlatform.instantiate()
	new_Platform.top_level = true
	self.add_child(new_Platform)
	new_Platform.name = "PlayerPlatform"
	new_Platform.position = get_global_mouse_position()
	
#Reset game and position if player leaves screen	
func _on_visible_on_screen_notifier_2d_screen_exited():
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body:):
	if body.is_in_group("platforms"):
		Is_Platform = true
		#print("on platform")


func _on_area_2d_body_exited(body:):
	if body.is_in_group("platforms"):
		Is_Platform = false
		#print("off platform")
