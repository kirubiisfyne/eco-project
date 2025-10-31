extends StaticBody2D

#for tutorial
signal not_done_yet(title)
signal quest_not_obtained(title)

@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var quest_master: NPC
@export var world_map: Node2D

func _ready() -> void:
	pass

func interact() -> void:
	if PlayerConditionals.movement_tut_done:
		var qm_name: String = quest_master.name
		var qm_score = world_map.current_qm[qm_name]
		if qm_score >= 2:
			$CollisionShape2D.disabled = true
			sprite_2d.play("end")
			await sprite_2d.animation_finished
			quest_master.NPC_score += 1
			queue_free()
		else:
			emit_signal("quest_not_obtained", "quest_not_obtained_yet")
	else:
		emit_signal("not_done_yet", "not_finished_tutorial")
