extends EnemyAI

enum states {
	IDLE,
	SLASH,
	SCREAM
}

var current_state = states.IDLE
var player_in: PlayerFighting
var being_damaged: bool = false

@export var damage: int = 3
@export var player_fight: PlayerFighting

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var bullet_spawn: Marker2D = $bullet_spawn
@onready var reload: Timer = $bullet_spawn/reload

@onready var BULLET = preload("res://source/actors/enemies/trash_boss/bullet/bullet.tscn")

func _ready() -> void:
	self_damaged.connect(damaged_anim)

func slash_attack() -> void:
	if player_in:
		player_in.deal_damage(damage)

func screaming_tec() -> void:
	reload.start()

func stop_reload() -> void:
	reload.stop()

func shoot() -> void:
	var target = player_fight.global_position
	var direction = (self.global_position - target)
	var bullet_instance = BULLET.instantiate()
	
	bullet_instance.direction = direction
	bullet_instance.position = bullet_spawn.position
	add_child(bullet_instance)


func damaged_anim() -> void:
	if not is_damaged:
		animation_player.play("damaged")
		

func start_timer() -> void:
	timer.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('fighter'):
		player_in = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group('fighter'):
		player_in = null


func _on_timer_timeout() -> void:
	var rand_i = randi_range(0, 10)
	if rand_i >= 7:
		current_state = states.SCREAM
	else:
		current_state = states.SLASH


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "slash") or (anim_name == "scream"):
		timer.start()
		current_state = states.IDLE


func finished_damage_anim(anim_name: StringName) -> void:
	is_damaged = false


func _on_reload_timeout() -> void:
	shoot()
