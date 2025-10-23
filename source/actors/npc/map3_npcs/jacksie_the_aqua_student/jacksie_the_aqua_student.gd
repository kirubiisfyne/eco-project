extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_3["jacksie_the_aqua_student"] == 1:
		dialogue_sub.jacksie_the_aqua_student_dial("quest_available")
	elif Quests.map_3["jacksie_the_aqua_student"] == 3:
		dialogue_sub.jacksie_the_aqua_student_dial("quest_done")
