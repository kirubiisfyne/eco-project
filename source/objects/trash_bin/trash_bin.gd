extends StaticBody2D
class_name TrashBinObject

signal open_trash_bin

@export var dialogue_sub: DialogueSubManager
@export var map_id: int = 1

func interact() -> void:
	match map_id:
		1:
			if PlayerConditionals.map1_finished:
				emit_signal("open_trash_bin")
			else:
				dialogue_sub.trash_bin_dial("not_finished")
		2:
			print("Map 2 Points: " + str(PlayerConditionals.map2_score))
			if PlayerConditionals.map2_finished:
				emit_signal("open_trash_bin")
			else:
				dialogue_sub.trash_bin_dial("not_finished")
		3:
			if PlayerConditionals.map3_finished:
				emit_signal("open_trash_bin")
			else:
				dialogue_sub.trash_bin_dial("not_finished")
