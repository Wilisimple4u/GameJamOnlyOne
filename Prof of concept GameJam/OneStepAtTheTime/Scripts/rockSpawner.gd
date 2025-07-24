extends Node2D
@onready var rock_scene = preload("res://OneStepAtTheTime/ObjectScenes/rock.tscn")
var spawn_area_x = 0
var spawn_area_y = 0
var rocks_limit = 1000

func _ready():
	pass

func _physics_process(_delta):
	spawn_area_x = get_viewport().size.x
	spawn_area_y = get_viewport().size.y
	#Spawn rocks
	var rocks_in_game = get_child_count()
	if rocks_in_game < rocks_limit :
		var rock = rock_scene.instantiate()
		add_child(rock)
		rock.position = Vector2(randi_range(-spawn_area_x, spawn_area_x), -spawn_area_y)
		
#TODO: The Rocks will randomly be spawned over empty space falling into a void of nothing. 
#Eventually there will be so many falling out of that map that it can no longer spawn any new rocks. 
#Solution: Add a long kill box to the bottom of the level project to remove them or Make the rocks automatically die once they have existed for X amount of time.
