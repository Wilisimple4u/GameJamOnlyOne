extends Node2D
#Preloads the PlayerPlatform for use withing the script.
const PlayPlatform = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")

#If the player presses the left mouse button it runs the spawnplatform function.

func _physics_process(_delta):
	if Input.is_action_just_pressed("Mouse_LeftClick"):
		spawnplatform()
		print("platform placed")
	pass
	
#Checks then deletes the previous playerplatform if it exists then creates a new playerplatform in the level scene.
func spawnplatform():
	var new_Platform = PlayPlatform.instantiate()
	if has_node("/root/Node2D/PlayerPlatform"):
		get_node("/root/Node2D/PlayerPlatform").queue_free()
	elif has_node("/root/Node2D/PlayerPlatform2"):
		get_node("/root/Node2D/PlayerPlatform2").queue_free()
	else:
		pass
	add_child(new_Platform)
	new_Platform.name = "PlayerPlatform"
	new_Platform.position = get_global_mouse_position()
	 
