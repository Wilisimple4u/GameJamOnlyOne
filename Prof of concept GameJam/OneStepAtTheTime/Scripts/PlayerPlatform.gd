extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		pass

func remove_platform():
	queue_free()

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		pass
