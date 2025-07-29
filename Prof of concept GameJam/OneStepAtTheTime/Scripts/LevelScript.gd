extends Node2D


#Preloads the PlayerPlatform for use withing the script.
const PlayPlatform = preload("res://OneStepAtTheTime/ObjectScenes/playerPlatform.tscn")
@onready var gameplay_menu = $PanelContainer


func _ready():
	gameplay_menu.hide()
	pass

func _input(event):
	if event.is_action_pressed("Pause"):
		pause_state()


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
