class_name Player
extends CharacterBody2D

@onready
var state_machine = $state_machine

@export 
var move_animation_speed = 0.09
 
const GRID_SIZE = 16

var direction = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#initialise state machine, with reference to player
	state_machine.init(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

# Called when input is... input
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
