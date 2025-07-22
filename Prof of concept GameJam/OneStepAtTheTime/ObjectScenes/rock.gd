extends RigidBody2D

func _on_area_2d_body_entered(_body):
		print("Rock Delete!")
		queue_free()
