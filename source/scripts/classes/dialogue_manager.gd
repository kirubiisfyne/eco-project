extends Node
class_name DialogueSubManager

#tut
const POLICE = preload("res://source/actors/npc/police/police.dialogue")
const POLICE_COMMANDO = preload("res://source/actors/npc/police_commando/police_commando.dialogue")
const TRASH_BIN = preload("res://source/objects/trash_bin/trash_bin.dialogue")

#mg_1
const PLAYER = preload("res://source/actors/player/player.dialogue")
const OLD_MAN = preload("res://source/actors/npc/map1_npcs/old_man/old_man.dialogue")
const KID_LARY = preload("res://source/actors/npc/map1_npcs/kid_lary/kid_lary.dialogue")
const ENVIRONMENTALIST_JANNA = preload("res://source/actors/npc/map1_npcs/environmentalist_janna/environmentalist_janna.dialogue")
const ADVENTURER_MICHEL = preload("res://source/actors/npc/map1_npcs/adventurer_michel/adventurer_michel.dialogue")
const TEENAGER_JOHNNY = preload("res://source/actors/npc/map1_npcs/teenager_johnny/teenager_johnny.dialogue")

const BUS = preload("res://source/actors/inter_objects/bus/bus.dialogue")

#map_2
const GARDENER_RYAN = preload("res://source/actors/npc/map2_npcs/gardener_ryan/gardener_ryan.dialogue")
const ECONOMIST_REBECCA = preload("res://source/actors/npc/map2_npcs/economist_rebecca/economist_rebecca.dialogue")
const GODDESS_BATHALA = preload("res://source/actors/npc/map2_npcs/goddess_bathala/goddess_bathala.dialogue")
const BIOLOGY_STUDENT_AKI = preload("res://source/actors/npc/map2_npcs/biology_student_aki/biology_student_aki.dialogue")
const WANDERING_CHILD_RYAN = preload("res://source/actors/npc/map2_npcs/wandering_child_ryan/wandering_child_ryan.dialogue")

#map_3
const BRENSTON_THE_TOURIST = preload("res://source/actors/npc/map3_npcs/brenston_the_tourist/brenston_the_tourist.dialogue")
const GAMEL_THE_DRAGON_BROTHERS = preload("res://source/actors/npc/map3_npcs/gamel_the_dragon_brothers/gamel_the_dragon_brothers.dialogue")
const JACKSIE_THE_AQUA_STUDENT = preload("res://source/actors/npc/map3_npcs/jacksie_the_aqua_student/jacksie_the_aqua_student.dialogue")
const JERICO_THE_LIFE_GUARD = preload("res://source/actors/npc/map3_npcs/jerico_the_life_guard/jerico_the_life_guard.dialogue")
const ZYBIE_THE_DRAGON_BROTHERS = preload("res://source/actors/npc/map3_npcs/zybie_the_dragon_brothers/zybie_the_dragon_brothers.dialogue")


func _ready() -> void:
	for i in get_tree().get_nodes_in_group("trashes"):
		i.quest_not_obtained.connect(player_dial)

#tutorial
func police_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(POLICE, title)
	PlayerConditionals.is_dialogue = true

func police_commando_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(POLICE_COMMANDO, title)
	PlayerConditionals.is_dialogue = true

func player_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(PLAYER, title)
	PlayerConditionals.is_dialogue = true

func trash_bin_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(TRASH_BIN, title)
	PlayerConditionals.is_dialogue = true

#mg_1
func old_man_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(OLD_MAN, title)
	PlayerConditionals.is_dialogue = true

func kid_lary_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(KID_LARY, title)
	PlayerConditionals.is_dialogue = true

func environmentalist_janna_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(ENVIRONMENTALIST_JANNA, title)
	PlayerConditionals.is_dialogue = true

func adventurer_michel_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(ADVENTURER_MICHEL, title)
	PlayerConditionals.is_dialogue = true

func teenager_johnny_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(TEENAGER_JOHNNY, title)
	PlayerConditionals.is_dialogue = true

func bus_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(BUS, title)
	PlayerConditionals.is_dialogue = true


#mg_2
func gardener_ryan_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(GARDENER_RYAN, title)
	PlayerConditionals.is_dialogue = true

func goddess_bathala_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(GODDESS_BATHALA, title)
	PlayerConditionals.is_dialogue = true

func economist_rebecca_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(ECONOMIST_REBECCA, title)
	PlayerConditionals.is_dialogue = true

func biology_student_aki_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(BIOLOGY_STUDENT_AKI, title)
	PlayerConditionals.is_dialogue = true

func wandering_child_ryan_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(WANDERING_CHILD_RYAN, title)
	PlayerConditionals.is_dialogue = true

#map_3
func brenston_the_tourist_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(BRENSTON_THE_TOURIST, title)
	PlayerConditionals.is_dialogue = true

func gamel_the_dragon_brothers_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(GAMEL_THE_DRAGON_BROTHERS, title)
	PlayerConditionals.is_dialogue = true

func jacksie_the_aqua_student_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(JACKSIE_THE_AQUA_STUDENT, title)
	PlayerConditionals.is_dialogue = true

func jerico_the_life_guard_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(JERICO_THE_LIFE_GUARD, title)
	PlayerConditionals.is_dialogue = true

func zybie_the_dragon_brothers_dial(title: String) -> void:
	DialogueManager.show_dialogue_balloon(ZYBIE_THE_DRAGON_BROTHERS, title)
	PlayerConditionals.is_dialogue = true
