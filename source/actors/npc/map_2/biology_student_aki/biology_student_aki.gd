extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_2["biology_student_aki"] == 1:
		dialogue_sub.biology_student_aki_dial("quest_available")
	elif Quests.map_2["biology_student_aki"] == 3:
		dialogue_sub.biology_student_aki_dial("quest_done")
