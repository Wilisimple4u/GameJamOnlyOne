extends Node2D
@onready var rock_scene = preload("res://rock.tscn")
var spawn_area = 0

func _ready():
	spawn_area = get_viewport().size.x

func _physics_process(delta):
	var rock = rock_scene.instantiate()
	add_child(rock)
	rock.position = Vector2(randi_range(-spawn_area, spawn_area), -100)
	
