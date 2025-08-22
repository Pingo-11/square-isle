extends Node2D

@export
var num_of_spawn_points: int
@export
var spawn_node: PackedScene

var spawn_points: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_points = get_children()
	
	spawn_random(spawn_points, spawn_node, num_of_spawn_points)

# spawn scene on random point, then removes the point
func spawn_random(spawn_points: Array[Node], scene: PackedScene, iterations: int) -> void:
	
	for i in range(iterations):
		if spawn_points.size() <= 0:
			pass
		
		var instance = scene.instantiate()
		var point = spawn_points.pick_random()
		instance.position = point.position 
		spawn_points.erase(point)
		add_child(instance)
