extends MoveInterface


func get_movement_input():
	var dir: Vector2
	
	# TODO stop priority (currently right, left, up, down)
	if Input.get_action_strength("ui_right"):
		dir = Vector2.RIGHT
	elif Input.get_action_strength("ui_left"):
		dir = Vector2.LEFT
	elif Input.get_action_strength("ui_up"):
		dir = Vector2.UP
	elif Input.get_action_strength("ui_down"):
		dir = Vector2.DOWN
	
	return dir
	
