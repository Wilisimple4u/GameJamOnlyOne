extends CharacterBody2D
@onready var can_be_seen = $VisibleOnScreenNotifier2D
@onready var hitbox = $CollisionShape2D
@onready var sprite = $AnimatedSprite2D
const PlayPlatform = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")
var platform_limit = 1
#Importing and reading the platform to be used.
#@onready var PlayerPlatform = load("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")
const SPEED = 150.0
const JUMP_VELOCITY = -300.0
# IF the character hits a triangular surface,
# which sends them just within range of being on top of another platforms collider,
# it can trigger another instant jump, the players negative (upward force) will increase more then normal.

func _ready() -> void:
	pass
		
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
		
	#Reset game if player gooes offscreen and dies	
	#if !can_be_seen.is_on_screen():
	#	get_tree().reload_current_scene()
	#	Camera.global_position.y = 0
	#	#Reload level
	#elif can_be_seen.is_on_screen():
	#	pass
 	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("A_Key", "D_Key")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("Mouse_LeftClick") and get_tree().current_scene.name == "Node2D":
		spawnplatform()
		#print("platform placed")
#Checks then deletes the previous playerplatform if it exists then creates a new playerplatform in the level scene.
func spawnplatform():
	#var path1 = "/root/Node2D/TempPlayerChar/PlayerPlatform"
	#var path2 = "/root/TempPlayerMove/PlayerPlatform"
		var new_Platform = PlayPlatform.instantiate()
		new_Platform.top_level = true
		self.add_child(new_Platform)
		new_Platform.name = "PlayerPlatform"
		new_Platform.position = get_global_mouse_position()
	
