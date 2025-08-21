extends Node
class_name PlayState

var parent: CharacterBody2D

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process_frame(delta: float) -> PlayState:
	return null
	
func process_input(event: InputEvent) -> PlayState:
	return null

func process_physics(delta: float) -> PlayState:
	return null
