extends Node
class_name AnimationManager

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var animation_tree: AnimationTree = $"../AnimationTree"
@onready var player: Player = $".."
@onready var sprite_trashbag: Sprite2D = $"../SpriteTrashbag"

var look_at: Vector2

func _process(delta: float) -> void:
	animation_tree.set("parameters/idle/blend_position", look_at)
	animation_tree.set("parameters/walk/blend_position", look_at)
	animation_tree.set("parameters/grab/blend_position", look_at)

	if player.can_move:
		if player.input_dir:
			animation_tree.get("parameters/playback").travel("walk")
			look_at = player.input_dir
		else:
			animation_tree.get("parameters/playback").travel("idle")
	else:
		if animation_tree.get("parameters/playback").get_current_node() == "idle":
			player.can_move = true


func idle_anim() -> void:
	sprite_trashbag.visible = false
	animation_tree.get("parameters/playback").travel("idle")

func put_away_anim() -> void:
	animation_tree.get("parameters/playback").travel("grab")
	player.can_move = false
	sprite_trashbag.visible = true
	await animation_tree.animation_finished
	sprite_trashbag.visible = false
	idle_anim()
