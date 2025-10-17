extends StaticBody2D

@onready var sprite_2d_2: Sprite2D = $Sprite2D2

@export var dialogue_sub: DialogueSubManager

func _process(delta: float) -> void:
	if PlayerConditionals.map2_score >= 5:
		sprite_2d_2.frame = 2

func interact() -> void:
	if PlayerConditionals.map2_segregation_finished:
		dialogue_sub.bus_dial("quest_finished2")
	elif not PlayerConditionals.map2_segregation_finished:
		dialogue_sub.bus_dial("quest_not_finished")
