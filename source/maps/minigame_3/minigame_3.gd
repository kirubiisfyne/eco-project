extends Node2D

signal on_trash_caught

var trash_caught: int = 0
var trash_caught_threshold = 4

@onready var goddess_bathala: StaticBody2D = $MG_goddess_bathala

func _ready() -> void:
	on_trash_caught.connect(_check_if_caught_enough)
	goddess_bathala.start_dialogue("start_mini_3")
	
func _process(delta: float) -> void:
	pass

func _check_if_caught_enough() -> void:
	trash_caught += 1
	if trash_caught >= trash_caught_threshold:
		$"BGM Player".stream_paused = true
		print("Minigame Finnished!")
