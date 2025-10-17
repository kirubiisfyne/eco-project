extends CharacterBody2D
class_name EnemyAI

signal self_damaged

@export var health_manager: HealthManager
var is_damaged: bool = false

func deal_damage(damage: int) -> void:
	if not is_damaged:
		health_manager.get_damage(damage) 
		emit_signal("self_damaged")
