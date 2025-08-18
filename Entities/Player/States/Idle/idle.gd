extends PlayState

@export
var move_state: PlayState

func enter():
	print("entered idle")

func process_input(event: InputEvent) -> PlayState:
	# TODO implement move component directly to player to generalise movement
	# This move componant can then talk to PlayState
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		dir = Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		dir = Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		dir = Vector2.UP
	if Input.is_action_pressed("ui_down"):
		dir = Vector2.DOWN
	
	if dir != Vector2.ZERO:
		parent.direction = dir
		return move_state
	return null
