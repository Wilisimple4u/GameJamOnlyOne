extends RigidBody2D

func _on_area_2d_body_entered(_body):
		queue_free()
