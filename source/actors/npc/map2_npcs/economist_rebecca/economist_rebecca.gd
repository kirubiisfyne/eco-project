extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_2["economist_rebecca"] == 1:
		dialogue_sub.economist_rebecca_dial("quest_available")
	elif Quests.map_2["economist_rebecca"] == 3:
		dialogue_sub.economist_rebecca_dial("quest_done")
