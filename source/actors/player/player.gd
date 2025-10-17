extends CharacterBody2D
class_name Player

const MAIN_PLAYER_CLEANING_SIM = preload("res://assets/tileset/actors/player/main_player_cleaning_sim.png")
const PLAYER_GIRL = preload("res://assets/tileset/actors/player/player_girl.png")

var input_dir: Vector2
@export var tile_size: float = 16
var is_moving: bool = false

@export var target_position: int

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_manager: AnimationManager = $animation_manager

enum states {
	IDLE,
	WALKING,
	ATTACKING,
	DAMAGED
}
var current_state = states.IDLE

@export var speed : float = 16
var can_move: bool = true

func _ready() -> void:
	if PlayerConditionals.gender_id == 0:
		sprite_2d.texture = MAIN_PLAYER_CLEANING_SIM
	elif PlayerConditionals.gender_id == 1:
		sprite_2d.texture = PLAYER_GIRL


func _physics_process(delta: float) -> void:
	input_dir = Vector2.ZERO
	current_state = states.IDLE
	if can_move:
		if Input.is_action_pressed("down"):
			input_dir = Vector2.DOWN
			current_state = states.WALKING
			rotate_raycast()
		elif Input.is_action_pressed("up"):
			input_dir = Vector2.UP
			current_state = states.WALKING
			rotate_raycast()
		elif Input.is_action_pressed("left"):
			input_dir = Vector2.LEFT
			current_state = states.WALKING
			rotate_raycast()
		elif Input.is_action_pressed("right"):
			input_dir = Vector2.RIGHT
			current_state = states.WALKING
			rotate_raycast()
	velocity = input_dir * Vector2(speed, speed)
	move_and_slide()


func move():
	if input_dir:
		ray_cast_2d.target_position = input_dir * Vector2(target_position,target_position)
		animation_manager.looking_at = input_dir
		if ray_cast_2d.get_collider()\
			and (input_dir * Vector2(target_position,target_position)) == ray_cast_2d.target_position:
				return
		elif not ray_cast_2d.get_collider():
			if is_moving == false:
					animation_manager.walking_anim()
					is_moving = true
					var tween = create_tween()
					tween.tween_property(self, "position", position + (input_dir * tile_size), .2)
					tween.tween_callback(move_false)

func rotate_raycast():
	ray_cast_2d.target_position = input_dir * Vector2(target_position,target_position)
	

func move_false():
	animation_manager.idle_anim()
	is_moving = false
