extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_2["goddess_bathala"] == 1:
		dialogue_sub.goddess_bathala_dial("quest_available")
	elif Quests.map_2["goddess_bathala"] == 3:
		dialogue_sub.goddess_bathala_dial("quest_done")
