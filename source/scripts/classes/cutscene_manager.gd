extends AnimationPlayer
class_name CutsceneManager

@export var police_commando: NPC
@export var police: NPC

func _ready() -> void:
	Cutscenes.police_commando_entrance.connect(cutscene_1)
	



func cutscene_1() -> void:
	police_commando.visible = true
	police.back_anim()
	if police_commando.has_method("walk_anim"):
		police_commando.walk_anim()
	play("cutscene_1")
	await animation_finished
	police_commando.idle_anim()
