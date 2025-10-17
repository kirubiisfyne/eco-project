extends Node2D

const POLICE = preload("res://source/actors/npc/police/police.dialogue")

@export var dialogue_sub: DialogueSubManager
@export var paused_menu: PausedMenu
@export var trashes_parent_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_sub.police_dial('starting_tutorial')
	PlayerConditionals.movement_tut_done = false
	PlayerConditionals.score = 0
	
	for i in trashes_parent_node.get_children():
		if i.has_signal("not_done_yet"):
			i.not_done_yet.connect(dialogue_sub.police_dial)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_settings"):
		paused_menu.visible = !paused_menu.visible
