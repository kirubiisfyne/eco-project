extends Node

@export var quest_master: NPC
@onready var sprite_2d_2: Sprite2D = $"../Sprite2D2"

func _process(delta: float) -> void:
	match Quests.map_2["wandering_child_ryan"]:
		1:
			sprite_2d_2.frame = 5
		2:
			sprite_2d_2.frame = 3
		3:
			sprite_2d_2.frame = 2
	
	if quest_master.NPC_score > 4:
		Quests.map_2["wandering_child_ryan"] = 3
