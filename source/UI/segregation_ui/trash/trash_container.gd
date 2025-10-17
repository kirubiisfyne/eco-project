extends Panel
class_name TrashContainer

const DI_NABUBULOK = preload("res://assets/objects/sorting/di_nabubulok.png")
const NABUBULOK = preload("res://assets/objects/sorting/nabubulok.png")
const NARERESIKLO = preload("res://assets/objects/sorting/nareresiklo.png")

@onready var sprite_2d: TextureRect = $Sprite2D

var type: Array = ["NABUBULOK", "DI NABUBULOK", "NARERESIKLO"]
var trash_type: String

var moving_position: Vector2 = Vector2(-2, -5)

func _ready() -> void:
	randomize()
	generate_trash()
	
	set_process(false)

func generate_trash() -> void:
	type.shuffle()
	trash_type = type.front()
	match trash_type:
		"NABUBULOK":
			sprite_2d.texture = NABUBULOK
		"DI NABUBULOK":
			sprite_2d.texture = DI_NABUBULOK
		"NARERESIKLO":
			sprite_2d.texture = NARERESIKLO
	

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			set_process(true)

func _process(delta: float) -> void:
	position = get_global_mouse_position() + moving_position
