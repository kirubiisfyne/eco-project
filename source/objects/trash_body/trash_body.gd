extends StaticBody2D

@export var trash_quest_ui: Control
@export var npc_master: NPC
@export var world_map: Node2D
@export var current_id: int = 0

@export var is_on_water: bool = false

func interact() -> void:
	var qm_name: String = npc_master.name
	var qm_score = Quests.map_3[qm_name]
	if Quests.map_3[qm_name] == 2 and qm_score >= 2:
		print("Trash Quest Reset signal emittied!")
		
		world_map.start_skillcheck(current_id, is_on_water)

func done_tb() -> void:
	npc_master.NPC_score += 5
	
	queue_free()
