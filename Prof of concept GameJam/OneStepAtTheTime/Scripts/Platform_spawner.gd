extends StaticBody2D

#Ready's the player platform for use and referance inside the script.
@onready var PlacePlatform = preload("res://OneStepAtTheTime/ObjectScenes/PlayerPlatform.tscn")

func _physics_process(delta: float):
	if Input.is_action_just_pressed("ui_down"):
		var PlatformPlaced = PlacePlatform.instantiate()
		add_child(PlatformPlaced)
