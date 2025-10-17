extends AnimationPlayer

@export var dsb: DialogueSubManager
@onready var animated_ui: Control = $"../CanvasLayer/animated_UI"


func cutscene_1() -> void:
	play("cut_1")
	await animation_finished
	dsb.player_dial('start_2_2')
	animated_ui.visible = false

func cutscene_2() -> void:
	play("cut_2")
	await animation_finished
	Transitions.fade_into("res://source/maps/minigame_2/minigame_2.tscn")
