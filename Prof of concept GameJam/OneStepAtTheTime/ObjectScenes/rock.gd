extends RigidBody2D

func _ready():
	var lifetime := Timer.new()
	add_child(lifetime)
	lifetime.wait_time = 8.0
	lifetime.one_shot = true
	lifetime.start()
	lifetime.timeout.connect(lifetime_end)

func lifetime_end():
	#print("Lifetime ended for " , name)
	queue_free()

func _on_area_2d_body_entered(_body):
		queue_free()
