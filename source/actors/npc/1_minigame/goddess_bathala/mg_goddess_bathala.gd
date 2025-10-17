extends StaticBody2D

const MG_GODDESS_BATHALA = preload("res://source/actors/npc/1_minigame/goddess_bathala/mg_goddess_bathala.dialogue")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	MinigameSettings.start_signal.connect(disappear)

func start_dialogue(title: String) -> void:
	DialogueManager.show_dialogue_balloon(MG_GODDESS_BATHALA, title)

func disappear() -> void:
	animation_player.play("disappear")
	await animation_player.animation_finished
	queue_free()
