extends Node
class_name HealthManager

signal occur_death
signal got_hurt
signal got_healed

@export var health : int = 9

func _process(delta: float) -> void:
	if health <= 0:
		death()

func death() -> void:
	emit_signal("occur_death")

func get_damage(val: int) -> void:
	set_health(-val)
	emit_signal("got_hurt")

func get_heal(val: int) -> void:
	set_health(val)
	emit_signal("got_healed")

func set_health(val: int) -> void:
	health += val
