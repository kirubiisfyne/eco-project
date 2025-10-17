extends Node

@onready var trash_slime: EnemyAI = $".."
@onready var animation_tree: AnimationTree = $"../AnimationTree"

#current_state = states.WALK

var look_at_x: float = 1.0

func _process(delta: float) -> void:
	look_at_x = round(-trash_slime.velocity.normalized().y)
	if look_at_x == 0:
		look_at_x = -1
	
	animation_tree.set("parameters/idle/blend_position", look_at_x)
	animation_tree.set("parameters/walk/blend_position", look_at_x)
	
	match trash_slime.current_state:
		trash_slime.states.IDLE:
			animation_tree.get("parameters/playback").travel("idle")
		trash_slime.states.WALK:
			animation_tree.get("parameters/playback").travel("walk")
	
