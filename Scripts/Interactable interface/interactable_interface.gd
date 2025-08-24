class_name Interactable
extends Node

# Differentiate between on touch interaction and prompted interaction
enum InteractionType { AUTO, PROMPT }

@export
var prompt_area: int = 16

var enabled: bool
var interaction_type: InteractionType = InteractionType.AUTO

## Called when player interacts 
func interact(character: CharacterBody2D):
	if not enabled:
		return

## Disables interactable
func disable(): 
	enabled = false

## Enables interactable
func enable():
	enabled = true
