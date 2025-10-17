extends Control

@export var map_number: int = 1

@onready var label: Label = $HBoxContainer/Label

func _process(delta: float) -> void:
	match map_number:
		1:
			label.text = str(PlayerConditionals.map1_score) + " / 5"
		2:
			label.text = str(PlayerConditionals.map2_score) + " / 5"
		3:
			label.text = str(PlayerConditionals.map3_score) + " / 5"
	
