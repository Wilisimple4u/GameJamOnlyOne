extends Node2D
@onready var rock_scene = preload("res://OneStepAtTheTime/ObjectScenes/rock.tscn")
var spawn_area = 0

func _ready():
	spawn_area = get_viewport().size.x

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _physics_process(delta):
	var rock = rock_scene.instantiate()
	add_child(rock)
	rock.position = Vector2(randi_range(-spawn_area, spawn_area), -100)
	
