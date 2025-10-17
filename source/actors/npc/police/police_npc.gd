extends NPC

@onready var first_meetup_dialogue := preload("res://source/actors/npc/police/first_meetup.dialogue")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var dialogue_sub: DialogueSubManager

func interact():
	print(NPC_score)
	
	if PlayerConditionals.movement_tut_done == false\
	and NPC_score < 4:
		dialogue_sub.police_dial("quest_available")

	elif PlayerConditionals.movement_tut_done == true\
	and PlayerConditionals.get_out_of_tutorial == false\
	and NPC_score >= 4:
		dialogue_sub.police_dial("quest_finished")

	elif PlayerConditionals.get_out_of_tutorial == true\
	and PlayerConditionals.movement_tut_done == true:
		dialogue_sub.police_dial("interact")

func back_anim() -> void:
	animation_player.play("look_back")
