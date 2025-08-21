extends Node

@export
var starting_state: PlayState

var current_state: PlayState

# Initialise state machine, giving each child a reference to parent
# Set start state to current state
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	
	swap_state(starting_state)

# Change to new state, calling exit logic
func swap_state(new_state: PlayState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		swap_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		swap_state(new_state)
		
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		swap_state(new_state)
