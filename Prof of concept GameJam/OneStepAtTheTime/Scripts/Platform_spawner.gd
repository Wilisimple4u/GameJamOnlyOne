extends Node2D

const PlayPlatfrom = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")


func _physics_process(_delta):
	if Input.is_action_just_pressed("Mouse_LeftClick"):
		spawnplatform()
		print("platform placed")
	


func spawnplatform():
	var new_Platform = PlayPlatfrom.instantiate()
	if get_node("/root/Node2D/Temp"):
		get_node("/root/Node2D/Temp").queue_free()
	elif get_node("/root/Node2D/Temp2"):
		get_node("/root/Node2D/Temp2").queue_free()
	else:
		pass
	add_child(new_Platform)
	new_Platform.name = "Temp"
	new_Platform.position = get_global_mouse_position() 



#Storage
#@onready var RiggedPlayerCharacter = get_tree().get_root().get_node("RiggedPlayerCharacter")
#@onready var PlayerPlatform = load("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")

#func _ready():
	#placePlatform()


#func placePlatform():
	#var placedplatform = PlayerPlatform.instantiate()
