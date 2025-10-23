extends Node

signal not_done_yet(title)
signal quest_not_obtained(title)

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var area2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_randomSprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#Methods
func _randomSprite() -> void:
	randomize()
	var frame_code_array: Array = [0,1,2,5,6,7,11,12,21,22,26]
	frame_code_array.shuffle()
	sprite_2d.frame = frame_code_array.front()
