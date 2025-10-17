extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func fade_into(scene: String) -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(scene)
	animation_player.play_backwards("fade")

func fade_to_exit() -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().quit()

func fade_to_reload() -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("fade")
