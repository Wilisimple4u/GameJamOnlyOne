extends Node2D

#Preloads the PlayerPlatform for use withing the script.
const PlayPlatfrom = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")
@onready var gameplay_menu = $PanelContainer

func _ready():
	gameplay_menu.hide()
	
func _input(event):
	if event.is_action_pressed("Pause"):
		pause_state()

#If the player presses the left mouse button it runs the spawnplatform function.
func _physics_process(_delta):
	if Input.is_action_just_pressed("Mouse_LeftClick"):
		spawnplatform()
		print("platform placed")
	pass


#Checks then deletes the previous playerplatform if it exists then creates a new playerplatform in the level scene.
func spawnplatform():
	var new_Platform = PlayPlatfrom.instantiate()
	if has_node("/root/MainWorldLevel/PlayerPlatform"):
		get_node("/root/MainWorldLevel/PlayerPlatform").queue_free()
	elif has_node("/root/MainWorldLevel/PlayerPlatform2"):
		get_node("/root/MainWorldLevel/PlayerPlatform2").queue_free()
	else:
		pass
	add_child(new_Platform)
	new_Platform.name = "PlayerPlatform"
	new_Platform.position = get_global_mouse_position()

func pause_state():
	if not gameplay_menu.visible:
		gameplay_menu.show()
		get_tree().paused = true
	else:
		gameplay_menu.hide()
		get_tree().paused = false


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Main menu.tscn")

#Requires to toggle the platform so it can't create a platform on the menu buttons.
func _on_button_pressed():
	pause_state()
