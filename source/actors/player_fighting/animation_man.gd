extends Node

@export var player_fighting: PlayerFighting
@export var attack_manager: AttackManager

@onready var animation_tree: AnimationTree = $"../AnimationTree"


var look_at: Vector2


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		player_fighting.can_move = false
		animation_tree.get("parameters/playback").travel("attack")
		

func _process(delta: float) -> void:
	animation_tree.set("parameters/idle/blend_position", look_at)
	animation_tree.set("parameters/walk/blend_position", look_at)
	animation_tree.set("parameters/attack/blend_position", look_at)
	
	if player_fighting.can_move:
		if player_fighting.direction:
			animation_tree.get("parameters/playback").travel("walk")
			look_at = player_fighting.direction
		else:
			animation_tree.get("parameters/playback").travel("idle")
	else:
		if animation_tree.get("parameters/playback").get_current_node() == "idle":
			player_fighting.can_move = true
			attack_manager.can_attack = true
