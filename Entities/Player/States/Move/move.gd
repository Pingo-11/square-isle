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
	
	dir = move_component.get_movement_input()
	
	#Handle if object is in the way
	target_pos = parent.position + dir * parent.GRID_SIZE
	var obstacle_check = obstacle_check(target_pos)

	if dir == Vector2.ZERO or obstacle_check:
		return false
	
	parent.direction = dir
	
	move_to(target_pos)
	return true
	# Interpolation between movement

func obstacle_check(target: Vector2) -> bool:
	for obstacle_chart in get_tree().get_nodes_in_group("obstacles"):
		var target_cell = obstacle_chart.local_to_map(target)
		if obstacle_chart.get_cell_source_id(target_cell) != -1:
			return true
	return false

func move_to(target: Vector2):
	# TODO Set to snap backwards if not input direction long enough after tween reset
	create_tween().tween_property(parent, "position" , target, parent.move_animation_speed)\
	.set_ease(Tween.EASE_OUT)\
	.set_trans(Tween.TRANS_LINEAR)\
	.connect("finished", on_tween_finish)

func on_tween_finish() -> void:
	move_finish = true
	
