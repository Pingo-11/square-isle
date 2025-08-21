extends PlayState

@export
var move_state: PlayState

func enter():
	#print("entered idle")
	pass

func process_input(event: InputEvent) -> PlayState:
	# TODO implement move component directly to player to generalise movement
	# This move componant can then talk to PlayState
	var dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") \
	or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_up"):
		return move_state

	return null
