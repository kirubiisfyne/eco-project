extends StaticBody2D

#for tutorial
signal not_done_yet(title)
signal quest_not_obtained(title)

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var quest_master: NPC
@export var world_map: Node2D

func _ready() -> void:
	randomize()
	var frame_code_array: Array = [0,1,2,5,6,7,11,12,21,22,26]
	frame_code_array.shuffle()
	sprite_2d.frame = frame_code_array.front()

func interact() -> void:
	if PlayerConditionals.movement_tut_done:
		var qm_name: String = quest_master.name
		var qm_score = world_map.current_qm[qm_name]
		if qm_score >= 2:
			audio_stream_player.play()
			await audio_stream_player.finished
			quest_master.NPC_score += 1
			queue_free()
		else:
			emit_signal("quest_not_obtained", "quest_not_obtained_yet")
	else:
		emit_signal("not_done_yet", "not_finished_tutorial")
