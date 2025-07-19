extends CharacterBody2D

const GRID_SIZE = 16

@export var move_animation_speed = 0.09

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
#region Grid movement
	if Input.is_action_just_released("ui_right"):
		create_tween().tween_property(self, "position" , Vector2(position.x + 16, position.y), move_animation_speed)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_LINEAR)
	if Input.is_action_just_released("ui_left"):
		create_tween().tween_property(self, "position" , Vector2(position.x - 16, position.y), move_animation_speed)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_LINEAR)
	if Input.is_action_just_released("ui_up"):
		create_tween().tween_property(self, "position" , Vector2(position.x, position.y - 16), move_animation_speed)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_LINEAR)
	if Input.is_action_just_released("ui_down"):
		create_tween().tween_property(self, "position" , Vector2(position.x, position.y + 16), move_animation_speed)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_LINEAR)
#endregion
