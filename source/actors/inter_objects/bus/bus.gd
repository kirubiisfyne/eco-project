extends StaticBody2D

@onready var sprite_2d_2: Sprite2D = $Sprite2D2

@export var dialogue_sub: DialogueSubManager

func _process(delta: float) -> void:
	if PlayerConditionals.map1_segregation_finished:
		sprite_2d_2.frame = 2

func interact() -> void:
	if PlayerConditionals.map1_segregation_finished:
		dialogue_sub.bus_dial("quest_finished")
	elif not PlayerConditionals.map1_segregation_finished:
		dialogue_sub.bus_dial("quest_not_finished")
