extends Control


@export var player_health : HealthManager
@onready var health_container: HBoxContainer = $health_container

const HEART = preload("res://source/UI/minigame_UI/heart.tscn")

func _ready() -> void:
	for i in player_health.health:
		var heartui_inst = HEART.instantiate()
		health_container.add_child(heartui_inst)
	player_health.got_hurt.connect(remove_heart)

func remove_heart() -> void:
	var hearts = health_container.get_children()
	for i in hearts:
		i.queue_free()
	
	for i in player_health.health:
		var heartui_inst = HEART.instantiate()
		health_container.add_child(heartui_inst)
