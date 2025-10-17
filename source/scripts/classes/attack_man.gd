extends Node
class_name AttackManager

@export var damage: int = 3

@export var animation_man: Node

var current_enemy: Array[CharacterBody2D]

var can_attack: bool = true


func deal_damage() -> void:
	if can_attack:
		if current_enemy:
			for c in current_enemy:
				c.deal_damage(damage)
				can_attack = false


func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		current_enemy.append(body)


func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy") and current_enemy.has(body):
		MinigameSettings.minigame_1_score += 1
		print('what')
		current_enemy.erase(body)
