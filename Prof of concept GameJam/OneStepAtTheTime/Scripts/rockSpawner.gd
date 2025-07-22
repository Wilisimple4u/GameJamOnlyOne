extends Node2D
@onready var rock_scene = preload("res://OneStepAtTheTime/ObjectScenes/rock.tscn")
var spawn_area_x = 0
var spawn_area_y = 0
var rocks_limit = 1000

func _ready():
	spawn_area_x = get_viewport().size.x
	spawn_area_y = get_viewport().size.y

func _physics_process(_delta):
	var rocks_in_game = get_child_count()
	if rocks_in_game < rocks_limit :
		var rock = rock_scene.instantiate()
		add_child(rock)
		rock.position = Vector2(randi_range(-spawn_area_x, spawn_area_x), -spawn_area_y)
