extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_1["teenager_johnny"] == 1:
		dialogue_sub.teenager_johnny_dial("quest_available")
	elif Quests.map_1["teenager_johnny"] >= 3:
		dialogue_sub.teenager_johnny_dial("quest_done")
