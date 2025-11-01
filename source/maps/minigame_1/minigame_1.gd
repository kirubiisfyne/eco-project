extends Node2D

@export var mg_bathala: StaticBody2D

@onready var pause_menu: PausedMenu = $CanvasLayer/pause_menu

func _ready() -> void:
	for i in get_tree().get_nodes_in_group("enemy"):
		i.set_physics_process(false)
	MinigameSettings.start_signal.connect(start_minigame)
	if mg_bathala.has_method("start_dialogue"):
		mg_bathala.start_dialogue("start_mini_1")

func start_minigame() -> void:
	for i in get_tree().get_nodes_in_group("enemy"):
		if i.has_method("timer_start"):
			i.timer_start()

func _process(delta: float) -> void:
	if MinigameSettings.minigame_1_score >= 5:
		print("Minigame Finnished!")
		
		Transitions.fade_into("res://source/maps/map2/map_2.tscn")
		MinigameSettings.minigame_1_score = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_settings"):
		pause_menu.visible = !pause_menu.visible
