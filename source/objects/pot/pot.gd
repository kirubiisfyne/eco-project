extends StaticBody2D

@onready var wo_plant: Sprite2D = $wo_plant
@onready var w_plant_watered: Sprite2D = $w_plant_watered
@onready var w_plant_bud: Sprite2D = $w_plant_bud
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var quest_master: NPC
@export var world_map: Node2D

@export var is_plant_wet: bool = false

func _ready() -> void:
	randomize()

func interact() -> void:
	var qm_score = world_map.current_qm[quest_master.name]
	if qm_score >= 2:
		audio_stream_player.play()
		await audio_stream_player.finished
		wo_plant.visible = false
		if is_plant_wet:
			w_plant_watered.visible = true
		else:
			w_plant_bud.visible = true
		quest_master.NPC_score += 1
