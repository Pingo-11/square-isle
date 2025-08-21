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
			move_finish = true
			return idle_state
	return null

func enter()-> void:
	#print("entered move")
	try_move()

func try_move() -> bool:
	var dir = Vector2.ZERO
	var target_pos : Vector2
	var target_cell : Vector2
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
	
	#Handle if object is in the way
	target_pos = parent.position + dir * parent.GRID_SIZE
	var obstacle_check = obstacle_check(target_pos)

	if dir == Vector2.ZERO or obstacle_check:
		return false
	
	parent.direction = dir
	
	# Interpolation between movement
	# TODO Set to snap backwards if not input direction long enough after tween reset
	create_tween().tween_property(parent, "position" , target_pos, parent.move_animation_speed)\
	.set_ease(Tween.EASE_OUT)\
	.set_trans(Tween.TRANS_LINEAR)\
	.connect("finished", on_tween_finish)
	return true

func obstacle_check(target_pos: Vector2) -> bool:
	for obstacle_chart in get_tree().get_nodes_in_group("obstacles"):
		var target_cell = obstacle_chart.local_to_map(target_pos)
		if obstacle_chart.get_cell_source_id(target_cell) != -1:
			return true
	return false

func on_tween_finish() -> void:
	move_finish = true
