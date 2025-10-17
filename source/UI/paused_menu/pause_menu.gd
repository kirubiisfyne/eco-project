extends Control
class_name PausedMenu

signal game_resumed

@onready var music_vol: HSlider = $settings/VBoxContainer/music_vol
@onready var sfx_volume: HSlider = $settings/VBoxContainer/sfx_volume
@onready var paused_menu: VBoxContainer = $VBoxContainer
@onready var settings: Control = $settings

func _ready() -> void:
	music_vol.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	sfx_volume.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _on_resume_game_button_up() -> void:
	visible = false
	emit_signal("game_resumed")


func _on_main_menu_button_up() -> void:
	Transitions.fade_into("res://source/UI/main_menu/main_menu.tscn")



func _on_quit_button_up() -> void:
	Transitions.fade_to_exit()


func _on_music_vol_drag_ended(value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(music_vol.value))


func _on_sfx_volume_drag_ended(value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(sfx_volume.value))


func _on_settings_button_up() -> void:
	paused_menu.visible = false
	settings.visible = true


func _on_back_to_paused_button_up() -> void:
	settings.visible = false
	paused_menu.visible = true
