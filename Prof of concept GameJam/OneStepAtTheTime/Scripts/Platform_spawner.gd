extends Node2D


var Platform = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		placePlatform()

func placePlatform():
	var PP = Platform.instantiate()
	get_parent().add.child(PP)






#Storage
#@onready var RiggedPlayerCharacter = get_tree().get_root().get_node("RiggedPlayerCharacter")
#@onready var PlayerPlatform = load("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")

#func _ready():
	#placePlatform()


#func placePlatform():
	#var placedplatform = PlayerPlatform.instantiate()
