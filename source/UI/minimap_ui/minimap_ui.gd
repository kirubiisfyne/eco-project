extends CanvasLayer
class_name MinimapUI

@export var player: CharacterBody2D
@export var tilemap_layers: Node2D
@export var player_camera: Camera2D
@export var NPCS: Array[NPC]

@onready var sub_viewport: SubViewport = $SubViewportContainer/SubViewport
@onready var big_sub_viewport: SubViewport = $WholeMapViewer/SubViewportContainer/SubViewport
@onready var whole_map_viewer: Panel = $WholeMapViewer

const BOY_PORTRAIT_FACE = preload("res://assets/portraits/boy_portrait_face.png")

var MinimapPlayer
var BigMinimapPLayer
var tml_duplicate
var camera2d : Camera2D = Camera2D.new()

func _ready() -> void:
	MinimapPlayer = Sprite2D.new()
	MinimapPlayer.set_texture(BOY_PORTRAIT_FACE)
	MinimapPlayer.set_texture_filter(CanvasItem.TEXTURE_FILTER_NEAREST)
	MinimapPlayer.set_scale(Vector2(4, 4))
	MinimapPlayer.set_hframes(10)
	MinimapPlayer.set_vframes(3)
	MinimapPlayer.set_z_index(5)
	
	camera2d.set_zoom(Vector2(0.5, 0.5))
	camera2d.set_limit(0, player_camera.limit_left)
	camera2d.set_limit(2, player_camera.limit_right)
	camera2d.set_limit(1, player_camera.limit_top)
	camera2d.set_limit(3, player_camera.limit_bottom)
	
	
	tml_duplicate = tilemap_layers.duplicate()
	
	for npc in NPCS:
		var MinimapNPC = npc.duplicate()
		MinimapNPC.position = npc.position
		sub_viewport.add_child(MinimapNPC)
	sub_viewport.add_child(MinimapPlayer)
	MinimapPlayer.add_child(camera2d)
	sub_viewport.add_child(tml_duplicate)
	
	
	var big_camera = Camera2D.new()
	BigMinimapPLayer = Sprite2D.new()
	
	BigMinimapPLayer.set_texture(BOY_PORTRAIT_FACE)
	BigMinimapPLayer.set_texture_filter(CanvasItem.TEXTURE_FILTER_NEAREST)
	BigMinimapPLayer.set_scale(Vector2(4, 4))
	BigMinimapPLayer.set_hframes(10)
	BigMinimapPLayer.set_vframes(3)
	BigMinimapPLayer.set_z_index(5)
	
	big_camera.set_zoom(Vector2(1, 1))
	big_camera.set_limit(0, player_camera.limit_left)
	big_camera.set_limit(2, player_camera.limit_right)
	big_camera.set_limit(1, player_camera.limit_top)
	big_camera.set_limit(3, player_camera.limit_bottom)
	big_sub_viewport.add_child(tilemap_layers.duplicate())
	for npc in NPCS:
		var npc_dup = npc.duplicate()
		npc_dup.position = npc.position
		big_sub_viewport.add_child(npc_dup)
	big_sub_viewport.add_child(BigMinimapPLayer)
	BigMinimapPLayer.add_child(big_camera)
	
	#
	#MinimapPlayer = player.duplicate()
	#camera2d.set_zoom(Vector2(0.5, 0.5))
	#for npc in NPCS:
		#var new_npc = npc.duplicate()
		#new_npc.position = npc.position
		#sub_viewport.add_child(new_npc)
		#if npc.NPC_score >= 5:
			#new_npc.call_deferred('queue_free')
#
	#if MinimapPlayer.has_node("Camera2D"):
		#var old_camera = MinimapPlayer.get_node("Camera2D")
		#MinimapPlayer.remove_child(old_camera)
#
	#sub_viewport.add_child(tilemap_layers.duplicate())
	#MinimapPlayer.add_child(camera2d)
	#sub_viewport.add_child(MinimapPlayer)

func _process(delta: float) -> void:
	MinimapPlayer.position = player.position
	BigMinimapPLayer.position = player.position


func _on_sub_viewport_container_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			whole_map_viewer.visible = !whole_map_viewer.visible
