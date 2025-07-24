extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		print("CharacterBody2D entered!")
	


func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		print("CharacterBody2D left!")
