extends Node2D
class_name Map2

@onready var actors = get_tree().get_nodes_in_group("actors")

@onready var pause_menu: PausedMenu = $CanvasLayer/pause_menu
@onready var cutscene_manager: AnimationPlayer = $CutsceneManager

@onready var mis_1: Node2D = $mis_list/mis1
@onready var mis_2: Node2D = $mis_list/mis2
@onready var mis_3: Node2D = $mis_list/mis3
@onready var mis_4: Node2D = $mis_list/mis4
@onready var mis_5: Node2D = $mis_list/mis5

@export var dialogue_sub: DialogueSubManager

var current_qm: Dictionary = Quests.map_2

func _ready() -> void:
	dialogue_sub.player_dial('start_2')
	Quests.open_mission_2.connect(open_mission)
	Cutscenes.mg2_cutscene_1.connect(cutscene_manager.cutscene_1)
	Cutscenes.mg2_cutscene_2.connect(cutscene_manager.cutscene_2)
	PlayerConditionals.movement_tut_done = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_settings"):
		pause_menu.visible = !pause_menu.visible
	

func _process(delta: float) -> void:
	for actor in actors:
		if PlayerConditionals.is_dialogue:
			actor.set_physics_process(false)
		else:
			actor.set_physics_process(true)

func open_mission(num: int) -> void:
	match num:
		1:
			mis_1.visible = true
		2:
			mis_2.visible = true
		3:
			mis_3.visible = true
		4:
			mis_4.visible = true
		5:
			mis_5.visible = true
