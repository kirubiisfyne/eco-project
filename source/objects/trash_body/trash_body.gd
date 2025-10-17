extends StaticBody2D

signal open_tb_skillcheck(id)

@export var npc_master : NPC
@export var world_map: Node2D
@export var current_id: int = 0

func interact() -> void:
	var qm_name: String = npc_master.name
	var qm_score = world_map.current_qm[qm_name]
	if qm_score >= 2:
		emit_signal("open_tb_skillcheck", current_id)
		
		

func done_tb() -> void:
	npc_master.NPC_score += 5
	queue_free()
