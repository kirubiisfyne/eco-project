extends AnimationPlayer

@onready var bus: Sprite2D = $"../bus"

func _ready() -> void:
	Cutscenes.mg_cutscene_1.connect(cutscene_1)
	Cutscenes.mg_cutscene_2.connect(cutscene_2)

func cutscene_1() -> void:
	play("cut_1")
	await animation_finished
	bus.visible = false
	

func cutscene_2() -> void:
	play("cut_2")
	Transitions.fade_into("res://source/maps/minigame_1/minigame_1.tscn")
