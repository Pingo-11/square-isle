extends Node

@export
var group_name: String

var parent_position: Vector2
var parent: CharacterBody2D

const GRID_SIZE = GlobalVariables.GRID_SIZE

func _ready() -> void:
	parent = get_parent()

#func _process(delta: float) -> void:
	#parent_position = parent.global_position.snapped(Vector2(GRID_SIZE, GRID_SIZE))
	#var interactable_nodes = get_overlapped_nodes()
	#if interactable_nodes.size() > 0:
		#for interactable in interactable_nodes:
			#interactable.interact(parent)


# Finds all Interactable nodes 
func get_overlapped_nodes() -> Array:
	var nodes = []
	for node in get_tree().get_nodes_in_group(group_name):
		if node.global_position.snapped(Vector2(GRID_SIZE, GRID_SIZE)) == parent_position:
			print("appended interactable")
			nodes.append(node)
	return nodes


func _on_move_reached_new_cell() -> void:
	parent_position = parent.global_position.snapped(Vector2(GRID_SIZE, GRID_SIZE))
	var interactable_nodes = get_overlapped_nodes()
	if interactable_nodes.size() > 0:
		for interactable in interactable_nodes:
			interactable.interact(parent)
