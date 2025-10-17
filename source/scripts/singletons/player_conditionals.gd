extends Node

signal back_to_menu
var is_dialogue: bool = false
var movement_tut_done: bool = false
var get_out_of_tutorial: bool = false
var score: int = 0

#map1
var map1_score: int = 0
var map1_segregation_finished: bool = false
var map1_finished: bool = false

#map2
var map2_score: int = 0
var map2_segregation_finished: bool = false
var map2_finished: bool = false

#map3
var map3_score: int = 0
var map3_segregation_finished: bool = false
var map3_finished: bool = false

#player ids and all that
var player_name: String
var gender_id: int = 0

func back_to_main_menu() -> void:
	emit_signal("back_to_menu")
