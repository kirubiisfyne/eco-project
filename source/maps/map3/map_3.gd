extends Node2D
class_name Map3

@onready var actors = get_tree().get_nodes_in_group("actors")

@onready var pause_menu: PausedMenu = $CanvasLayer/pause_menu

@onready var trash_body_skillcheck: Control = $CanvasLayer/TrashBodySkillcheck
@onready var cutscene_manager: AnimationPlayer = $CutsceneManager

@onready var quest_banner: QuestBanner = $CanvasLayer/QuestBanner
@onready var minimap_ui: MinimapUI = $MinimapUI

@onready var mis_1: Node2D = $"mis_list/Wildfire Quest"
@onready var mis_2: Node2D = $mis_list/mis2
@onready var mis_3: Node2D = $mis_list/mis3
@onready var mis_4: Node2D = $mis_list/mis4
@onready var mis_5: Node2D = $mis_list/mis5

@export var dialogue_sub: DialogueSubManager

var current_qm: Dictionary = Quests.map_3

func _ready() -> void:
	dialogue_sub.player_dial('start_3')
	Quests.open_mission_3.connect(open_mission)
	Cutscenes.mg3_cutscene_1.connect(cutscene_manager.cutscene_1)
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
	
	if PlayerConditionals.map3_finished == false\
	and PlayerConditionals.map3_score >= 5:
		PlayerConditionals.map3_finished = true

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

func start_skillcheck(tb_id: int, is_on_water: bool) -> void:
	print("map_3.gd: start_skillcheck() executed!")
	
	trash_body_skillcheck.current_id = tb_id
	trash_body_skillcheck.start_skillcheck(is_on_water)
	
	trash_body_skillcheck.visible = true
	quest_banner.visible = false
	minimap_ui.visible = false
	
	trash_body_skillcheck.finished_cleaning.connect(remove_trashbag)

func remove_trashbag(tb_id: int) -> void:
	trash_body_skillcheck.visible = false
	quest_banner.visible = true
	minimap_ui.visible = true
	for i in get_tree().get_nodes_in_group("trashbody"):
		if i.current_id == tb_id:
			i.done_tb()
