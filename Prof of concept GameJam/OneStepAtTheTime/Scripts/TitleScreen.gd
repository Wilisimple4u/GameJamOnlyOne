extends Control

const TestLevel = preload("res://OneStepAtTheTime/GameScenes/TempLevel.tscn")



#When the NewGameButton is pressed on the start menu, 
#It get's the change scene to file command changing it to our selected level scene.
#Currently it is just the TestLevela
func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://OneStepAtTheTime/GameScenes/TempLevel.tscn")

#When the ContinueButton is pressed on the start menu, 
#It get's the change scene to file command changing it to our selected level scene.
#Currently it is just the Template of the mainlevel
func _on_continue_game_button_pressed():
	get_tree().change_scene_to_file("res://OneStepAtTheTime/GameScenes/main_world_level.tscn")

#When the SettingsButton is pressed on the start menu, 
#It get's the change scene to file command changing it to our selected level scene.
#Currently it is just the Template of the mainlevel
func _on_settings_start_button_pressed():
	get_tree().change_scene_to_file("res://settings_menu.tscn")

#Listens and awaits an action from the start menu.
#When the QuitButton on the start menu is pressed it get's the quit command, closing the game Obviously.
func _on_quit_start_button_pressed():
	get_tree().quit()
