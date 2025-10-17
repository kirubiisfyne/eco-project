extends EnemyAI

enum states {
	IDLE,
	WALK,
	DAMAGED
}

var current_state = states.IDLE
var state_toggler: bool = false
var direction: Vector2


@export var speed: float = 20
@export var to_walk_time: float = 0.5
@export var to_idle_time: float = 5.0

@export var player: PlayerFighting
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var hit_anim_player: AnimationPlayer = $charactersprite/hit_anim_player
@onready var timer: Timer = $Timer

func _ready() -> void:
	health_manager.got_hurt.connect(damaged_animation)
	health_manager.occur_death.connect(self_death)

func _physics_process(delta: float) -> void:
	var current_location = self.global_position
	var next_location = navigation_agent_2d.get_next_path_position()
	var new_velocity = current_location.direction_to(next_location) * speed
	
	if player:
		update_target_location(player.global_position)
	
	match current_state:
		states.IDLE:
			velocity = Vector2.ZERO
			is_damaged = false
		states.WALK:
			velocity = new_velocity
			is_damaged = false
		states.DAMAGED:
			velocity = Vector2.ZERO
			is_damaged = true
	
	move_and_slide()

func update_target_location(target_location: Vector2) -> void:
	navigation_agent_2d.target_position = target_location

func damaged_animation() -> void:
	current_state = states.DAMAGED
	hit_anim_player.play("damaged")
	await hit_anim_player.animation_finished
	current_state = states.IDLE

func self_death() -> void:
	current_state = states.DAMAGED
	hit_anim_player.play("damaged")
	await hit_anim_player.animation_finished
	queue_free()

func timer_start() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	state_toggler = !state_toggler
	if current_state != states.DAMAGED:
		if state_toggler == true:
			timer.wait_time = to_idle_time
			current_state = states.IDLE
		else:
			timer.wait_time = to_walk_time
			current_state = states.WALK

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	set_physics_process(true)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	set_physics_process(false)
