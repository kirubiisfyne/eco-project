extends EnemyAI

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	health_manager.got_hurt.connect(damaged)
	health_manager.occur_death.connect(self_delete)

func damaged() -> void:
	animation_player.play("damaged")

func self_delete() -> void:
	self.queue_free()
