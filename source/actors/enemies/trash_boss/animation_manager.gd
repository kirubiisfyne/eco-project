extends Node

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var trash_boss: CharacterBody2D = $".."

func _process(delta: float) -> void:
	match trash_boss.current_state:
		trash_boss.states.IDLE:
			animation_player.play("idle")
		trash_boss.states.SLASH:
			animation_player.play("slash")
		trash_boss.states.SCREAM:
			animation_player.play("scream")
