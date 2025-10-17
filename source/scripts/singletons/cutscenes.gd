extends Node

#tutorial part here
signal police_commando_entrance

#main game part 1 here
signal mg_cutscene_1
signal mg_cutscene_2

#main game part 2 here
signal mg2_cutscene_1
signal mg2_cutscene_2

#main game part 3 here
signal mg3_cutscene_1
signal mg3_cutscene_2

#tutorial part here
func tut_cut_1() -> void:
	emit_signal("police_commando_entrance")

#main game part 1 here
func mg_cut_1() -> void:
	emit_signal("mg_cutscene_1")

func mg_cut_2() -> void:
	emit_signal("mg_cutscene_2")

func mg2_cut_1() -> void:
	emit_signal("mg2_cutscene_1")

func mg2_cut_2() -> void:
	emit_signal("mg2_cutscene_2")

func mg3_cut_1() -> void:
	emit_signal("mg3_cutscene_1")

func mg3_cut_2() -> void:
	emit_signal("mg3_cutscene_2")
