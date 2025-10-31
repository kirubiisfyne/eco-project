extends AnimationPlayer

@export var dsb: DialogueSubManager
@onready var cutscene: Control = $"../CanvasLayer/Cutscene"

func cutscene_1() -> void:
	play("cut_1")
	await animation_finished

	dsb.player_dial('start_3_2')
	cutscene.visible = false
