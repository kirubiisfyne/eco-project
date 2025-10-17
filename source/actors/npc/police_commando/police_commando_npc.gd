extends NPC

@export var dialogue_sub: DialogueSubManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func interact() -> void:
	dialogue_sub.police_commando_dial("interact")

func walk_anim() -> void:
	animation_player.play("walkin")

func idle_anim() -> void:
	animation_player.play("idle")
