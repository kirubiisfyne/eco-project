extends CharacterBody2D
class_name PlayerFighting

@export var speed : float = 16

enum states {
	IDLE,
	WALKING,
	ATTACKING,
	DAMAGED
}

var current_state = states.IDLE
var direction := Vector2.ZERO
@export var can_move: bool = true
@export var health_manager: HealthManager

@onready var animation_player: AnimationPlayer = $charactersprite/AnimationPlayer

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	current_state = states.IDLE
	if can_move:
		if Input.is_action_pressed("down"):
			direction = Vector2.DOWN
			current_state = states.WALKING
		elif Input.is_action_pressed("up"):
			direction = Vector2.UP
			current_state = states.WALKING
		elif Input.is_action_pressed("left"):
			direction = Vector2.LEFT
			current_state = states.WALKING
		elif Input.is_action_pressed("right"):
			direction = Vector2.RIGHT
			current_state = states.WALKING
	velocity = direction * Vector2(speed, speed)
	
	move_and_slide()

func deal_damage(damage: int) -> void:
	health_manager.get_damage(damage)
	current_state = states.DAMAGED
	animation_player.play('damaged')


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'damaged':
		current_state = states.IDLE
