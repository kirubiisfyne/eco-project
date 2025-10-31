extends RigidBody2D

var dragging: bool = false
var offset: Vector2 = Vector2(0, 0)

@export var initial_force: float = 300.0  # strength of the initial push

func _ready() -> void:
	randomize()
	
	_start_random_motion()

func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	freeze = true
	
	dragging = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	freeze = false
	dragging = false

func _start_random_motion() -> void:
	randomize()
	
	var random_dir = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	apply_impulse(random_dir * initial_force)
