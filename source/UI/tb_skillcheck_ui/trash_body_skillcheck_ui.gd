extends Control

signal finished_cleaning(id)

@onready var trashbag: Area2D = $Trashbag

var trashes_grp: Array[RigidBody2D] = []

const TRASH_2 = preload("res://assets/objects/TrashBody/trash2.png")
const TRASH_3 = preload("res://assets/objects/TrashBody/trash3.png")
const TRASH_4 = preload("res://assets/objects/TrashBody/trash4.png")
const TRASH = preload("res://assets/objects/TrashBody/trash.png")
var trash_skin: Array

const TRASH_SCENE = preload("res://source/UI/tb_skillcheck_ui/trash.tscn")

var currently_cleaning: bool = false
var current_id: int = -1

func _ready() -> void:
	trash_skin = [TRASH_2,TRASH_3,TRASH_4,TRASH]
	randomize()
	start_skillcheck()

func start_skillcheck() -> void:
	currently_cleaning = true
	#256 - 968
	#184 - 384
	var x_minlimit: float = 256
	var y_minlimit: float = 184
	var x_maxlimit: float = 968
	var y_maxlimit: float = 384
	
	var trash_amount: int = 7
	
	for i in range(0, trash_amount):
		trash_skin.shuffle()
		
		var trash_copy = TRASH_SCENE.instantiate()
		var randomx = randf_range(x_minlimit, x_maxlimit)
		var randomy = randf_range(y_minlimit, y_maxlimit)
		trash_copy.position = Vector2(randomx, randomy)
		
		var trash_sprite = trash_copy.get_child(2)
		trash_sprite.texture = trash_skin.front()
		
		trashes_grp.append(trash_copy)
		
		add_child(trash_copy)

func _process(delta: float) -> void:
	if currently_cleaning:
		if trashes_grp.is_empty():
			emit_signal("finished_cleaning", current_id)
			currently_cleaning = false

func _on_trashbag_body_entered(body: Node2D) -> void:
	if body.is_in_group("trash_body_trashes"):
		trashes_grp.erase(body)
		body.queue_free()
