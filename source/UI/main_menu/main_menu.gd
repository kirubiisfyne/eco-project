extends Node2D

@onready var sprite_2d: Sprite2D = $background/player/Sprite2D
@onready var texture_rect: TextureRect = $CanvasLayer/Control/Panel2/VBoxContainer/HBoxContainer2/TextureRect
@onready var name_edit: LineEdit = $CanvasLayer/Control/Panel2/VBoxContainer/HBoxContainer/name_edit
@onready var gender_edit: CheckButton = $CanvasLayer/Control/Panel2/VBoxContainer/HBoxContainer2/VBoxContainer/gender_edit
@onready var panel_3: Panel = $CanvasLayer/Control/Panel3

const MAIN_PLAYER_CLEANING_SIM = preload("res://assets/tileset/actors/player/main_player_cleaning_sim.png")
const PLAYER_GIRL = preload("res://assets/tileset/actors/player/player_girl.png")
const BOY_ICON = preload("res://assets/tileset/actors/player/boy_icon.png")
const GIRL_ICON = preload("res://assets/tileset/actors/player/girl_icon.png")

func _ready() -> void:
	if PlayerConditionals.player_name:
		name_edit.text = PlayerConditionals.player_name

func _process(delta: float) -> void:
	if PlayerConditionals.gender_id == 0:
		sprite_2d.texture = MAIN_PLAYER_CLEANING_SIM
		texture_rect.texture = BOY_ICON
	elif PlayerConditionals.gender_id == 1:
		sprite_2d.texture = PLAYER_GIRL
		texture_rect.texture = GIRL_ICON

func toggle_minigame(toggle: bool) -> void:
	panel_3.visible = toggle


func _on_tutorial_button_up() -> void:
	Transitions.fade_into("res://source/maps/tutorial/tutorial.tscn")


func _on_main_game_button_up() -> void:
	Transitions.fade_into("res://source/maps/map1/map_1.tscn")


func _on_quit_button_down() -> void:
	Transitions.fade_to_exit()
	


func _on_name_edit_text_changed(new_text: String) -> void:
	PlayerConditionals.player_name = new_text


func _on_gender_edit_toggled(toggled_on: bool) -> void:
	if toggled_on == false:
		PlayerConditionals.gender_id = 0
	else:
		PlayerConditionals.gender_id = 1


func _on_settings_button_up() -> void:
	pass # Replace with function body.


func _on_mini_games_button_up() -> void:
	toggle_minigame(!panel_3.visible)


func _on_minigame_1_button_up() -> void:
	Transitions.fade_into('res://source/maps/minigame_1/minigame_1.tscn')


func _on_minigame_2_button_up() -> void:
	Transitions.fade_into("res://source/maps/minigame_2/minigame_2.tscn")
