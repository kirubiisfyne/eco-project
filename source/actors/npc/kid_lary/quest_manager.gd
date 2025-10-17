extends Node

@onready var sprite_2d_2: Sprite2D = $"../Sprite2D2"
@export var quest_master: NPC

func _process(delta: float) -> void:
	match Quests.map_1["kid_lary"]:
		1:
			sprite_2d_2.frame = 5
		2:
			sprite_2d_2.frame = 3
		3:
			sprite_2d_2.frame = 2
	
	if quest_master.NPC_score > 4 and Quests.map_1["kid_lary"] != 3:
		Quests.set_kid_lary(3)
