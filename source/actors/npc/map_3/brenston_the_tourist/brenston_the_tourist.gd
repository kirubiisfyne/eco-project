extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_3["brenston_the_tourist"] == 1:
		dialogue_sub.brenston_the_tourist_dial("quest_available")
	elif Quests.map_3["brenston_the_tourist"] == 3:
		dialogue_sub.brenston_the_tourist_dial("quest_done")
