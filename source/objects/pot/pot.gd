extends StaticBody2D

@onready var wo_plant: Sprite2D = $wo_plant
@onready var w_plant: Sprite2D = $w_plant
@onready var w_plant_2: Sprite2D = $w_plant2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var quest_master: NPC
@export var world_map: Node2D

func _ready() -> void:
	randomize()

func interact() -> void:
	var qm_score = world_map.current_qm[quest_master.name]
	if qm_score >= 2:
		var text_id = randi_range(0,1)
		audio_stream_player.play()
		await audio_stream_player.finished
		wo_plant.visible = false
		match text_id:
			0:
				w_plant.visible = true
			1: 
				w_plant_2.visible = true
		quest_master.NPC_score += 1
