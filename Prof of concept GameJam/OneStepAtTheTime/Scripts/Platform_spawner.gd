extends Node2D

const PlayPlatfrom = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")


func _physics_process(_delta):
	if Input.is_action_just_pressed("mouse_click"):
		spawnplatform()
		print("platform placed")


func spawnplatform():
	var new_Platform = PlayPlatfrom.instantiate()
	add_child(new_Platform)


#Storage
#@onready var RiggedPlayerCharacter = get_tree().get_root().get_node("RiggedPlayerCharacter")
#@onready var PlayerPlatform = load("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")

#func _ready():
	#placePlatform()


#func placePlatform():
	#var placedplatform = PlayerPlatform.instantiate()
