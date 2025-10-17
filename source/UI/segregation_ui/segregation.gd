extends Control

signal exit_trash_bin

@export var trash_bin: TrashBinObject

#specifications for each bins
@export var trash_number: int = 5
@export var map_id: int = 1

#placed in Vector for range. use x of each vector as low and y as high.
@export var x_range: Vector2
@export var y_range: Vector2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var trashes = []

const TRASH = preload("res://source/UI/segregation_ui/trash/trash.tscn")

func _ready() -> void:
	trash_bin.open_trash_bin.connect(open_segregation)
	for i in trash_number:
		var random_x: float = randf_range(x_range.x, x_range.y)
		var random_y: float = randf_range(y_range.x, y_range.y)
		var trash_instance = TRASH.instantiate()
		trashes.append(trash_instance)
		trash_instance.position = Vector2(random_x, random_y)
		add_child(trash_instance)

func _process(delta: float) -> void:
	if trashes.is_empty():
		match map_id:
			1:
				PlayerConditionals.map1_segregation_finished = true
			2:
				PlayerConditionals.map2_segregation_finished = true

func open_segregation() -> void:
	visible = true

func throw_trash(trash: Panel) -> void:
	trash.call_deferred("queue_free")
	audio_stream_player.play()
	if trashes.has(trash):
		trashes.erase(trash)

func _on_nabubulok_area_entered(area: Area2D) -> void:
	if area.name == "TrashArea":
		var trash = area.get_parent()
		if trash.trash_type == "NABUBULOK":
			throw_trash(trash)


func _on_di_nabubulok_area_entered(area: Area2D) -> void:
	if area.name == "TrashArea":
		var trash = area.get_parent()
		if trash.trash_type == "DI NABUBULOK":
			throw_trash(trash)


func _on_nareresiklo_area_entered(area: Area2D) -> void:
	if area.name == "TrashArea":
		var trash = area.get_parent()
		if trash.trash_type == "NARERESIKLO":
			throw_trash(trash)



func _on_exit_trash_bin_button_up() -> void:
	visible = false
	emit_signal("exit_trash_bin")
