extends Node2D

@onready var mg_goddess_bathala: StaticBody2D = $MG_goddess_bathala
@onready var trash_boss: CharacterBody2D = $trash_boss
@onready var game_over_screen: Control = $CanvasLayer/GameOverScreen
@onready var alive_music: AudioStreamPlayer = $CanvasLayer/AudioStreamPlayer
@onready var dead_music: AudioStreamPlayer = $CanvasLayer/AudioStreamPlayer2
@onready var pause_menu: PausedMenu = $CanvasLayer/pause_menu
@onready var player_fighting: PlayerFighting = $player_fighting

@export var tb_timer: Timer
@export var health_manager: HealthManager
@export var enemy_health_manager: HealthManager


func _ready() -> void:
	pause_menu.game_resumed.connect(toggle_gp_true)
	mg_goddess_bathala.start_dialogue("start_mini_2")
	MinigameSettings.start_signal.connect(start_minigame)
	health_manager.occur_death.connect(call_death)
	enemy_health_manager.occur_death.connect(game_won)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("open_settings"):
		pause_menu.visible = true
		toggle_game_process(false)

func toggle_gp_true() -> void:
	toggle_game_process(true)

func toggle_game_process(toggle: bool) -> void:
	player_fighting.set_physics_process(toggle)
	tb_timer.paused = !toggle

func start_minigame() -> void:
	trash_boss.start_timer()

func call_death() -> void:
	alive_music.stop()
	dead_music.play()
	game_over_screen.visible = true

func game_won() -> void:
	alive_music.stop()
	var tb_tween = trash_boss.create_tween()
	tb_tween.tween_property(trash_boss, 'modulate', Color(1,1,1,0), 1)
	await tb_tween.finished
	Transitions.fade_into("res://source/maps/map3/map_3.tscn")
