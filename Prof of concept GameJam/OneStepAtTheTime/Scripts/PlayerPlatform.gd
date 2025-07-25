extends StaticBody2D

var PlayerOnPlatform

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		var PlayerOnPlatform = true
		if PlayerOnPlatform == true:
			print("True")
	


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		var PlayerOnPlatform = false
		if PlayerOnPlatform == false:
			print("False")
