extends Control
class_name Player_UI

@onready var sub_viewport: SubViewport = $mini_map/SubViewport

@export var player: Player
@export var tilemap: TileMapLayer

var MinMapPlayer
var Camera

func _ready() -> void:
	MinMapPlayer = player.duplicate()
	Camera = Camera2D.new()
	Camera.zoom = Vector2(3,3)
	
	MinMapPlayer.add_child(Camera)
	
	sub_viewport.add_child(tilemap.duplicate())
	sub_viewport.add_child(MinMapPlayer)

#func _process(delta: float) -> void:
	#MinMapPlayer.position = player.position
