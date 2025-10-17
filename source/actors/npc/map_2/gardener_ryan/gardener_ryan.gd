extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_2["gardener_ryan"] == 1:
		dialogue_sub.gardener_ryan_dial("quest_available")
	elif Quests.map_2["gardener_ryan"] == 3:
		dialogue_sub.gardener_ryan_dial("quest_done")
