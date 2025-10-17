extends Control

@export var next_scene: PackedScene
 

func _on_try_again_button_up() -> void:
	Transitions.fade_to_reload()

func _on_skip_button_up() -> void:
	Transitions.fade_into(next_scene.resource_path)

func _on_main_menu_button_up() -> void:
	Transitions.fade_into("res://source/UI/main_menu/main_menu.tscn")
