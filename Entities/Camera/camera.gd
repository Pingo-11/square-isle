extends Camera2D

@export
var target_path: NodePath
@export
var lerp_speed: float

var target: Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = get_node(target_path)
	
	if target:
		position = lerp(position, target.position, 0.1).round()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !target:
		return
	
	position = lerp(position, target.position, lerp_speed).round()
