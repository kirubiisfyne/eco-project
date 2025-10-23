extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_1["old_man_andrew"] == 1:
		dialogue_sub.old_man_dial('quest_available_1')
	elif Quests.map_1["old_man_andrew"] >= 3:
		dialogue_sub.old_man_dial('quest_done_1')
