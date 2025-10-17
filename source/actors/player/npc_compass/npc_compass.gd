extends Node2D

@export var target_npc: NPC

func _process(delta: float) -> void:
	if target_npc.NPC_score != 5:
		look_at(target_npc.global_position)
	elif target_npc.NPC_score >= 5:
		call_deferred("queue_free")
