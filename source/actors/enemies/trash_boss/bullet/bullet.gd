extends Area2D

var direction: Vector2
var speed: float = 3
var rotate_speed: float = 0.2
var damage = 1

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite_2d.rotate(rotate_speed)
	global_position -= direction.normalized() * speed


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("fighter"):
		body.deal_damage(damage)
		queue_free()
