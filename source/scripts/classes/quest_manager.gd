extends Node
class_name quest_manager

@onready var sprite_2d: Sprite2D = $"../Sprite2D2"
@export var quest_master: NPC

func _process(delta: float) -> void:
	if quest_master.NPC_score == 0:
		sprite_2d.frame = 5
	elif quest_master.NPC_score <= 4:
		sprite_2d.frame = 3
	elif quest_master.NPC_score > 4:
		sprite_2d.frame = 2
