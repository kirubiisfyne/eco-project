extends NPC

@export var dialogue_sub: DialogueSubManager

func interact() -> void:
	if Quests.map_3["zybie_the_dragon_brothers"] == 1:
		dialogue_sub.zybie_the_dragon_brothers_guard_dial("quest_available")
	elif Quests.map_3["jerico_the_life_guard"] == 3:
		dialogue_sub.zybie_the_dragon_brothers_dial("quest_done")
