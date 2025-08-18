extends PlayState

@export
var idle_state: PlayState

var move_finish = false
var direction := Vector2.ZERO


# Return to idle if try to stop moving
func process_frame(delta: float) -> PlayState:
	if move_finish:
		move_finish = false
		if !try_move():
			return idle_state
	return null

func enter()-> void:
	print("entered move")
	try_move()

func try_move() -> bool:
	var dir = Vector2.ZERO
	# Input to direction mapping
	# TODO stop priority (currently right, left, up, down)
	if Input.get_action_strength("ui_right"):
		dir = Vector2.RIGHT
	elif Input.get_action_strength("ui_left"):
		dir = Vector2.LEFT
	elif Input.get_action_strength("ui_up"):
		dir = Vector2.UP
	elif Input.get_action_strength("ui_down"):
		dir = Vector2.DOWN
	
	if dir == Vector2.ZERO:
		return false
	#TODO object handling
	
	parent.direction = dir
	
	#interpolation between movement
	print("move %d", parent.direction)
	create_tween().tween_property(parent, "position" , parent.position + parent.direction * parent.GRID_SIZE, parent.move_animation_speed)\
	.set_ease(Tween.EASE_OUT)\
	.set_trans(Tween.TRANS_LINEAR)\
	.connect("finished", on_tween_finish)
	return true


func on_tween_finish() -> void:
	move_finish = true
