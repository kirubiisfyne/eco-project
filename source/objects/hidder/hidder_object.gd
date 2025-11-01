extends StaticBody2D

var has_timer_started: bool = false
var was_caught: bool = false
@export var is_a_hidder: bool = true
@export var minigame_3: Node2D

func _ready() -> void:
	_randomize_sprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_a_hidder:
		_move_when_invisible()
#region Setup

func _randomize_sprite() -> void:
	var hidder_sprites = [
		"Hidder_0",
		"Hidder_1",
		"Hidder_2",
		"Hidder_3",
		"Hidder_4"
	]
	
	hidder_sprites.shuffle()
	$"Hidden Sprite".animation = hidder_sprites.front()
	
	var trash_sprites = [
		"Trash_0",
		"Trash_1",
		"Trash_2",
		"Trash_3",
	]
	
	trash_sprites.shuffle()
	$"Trash Sprite".animation = trash_sprites.front()

func _on_timer_timeout() -> void:
	$AnimationPlayer.play("RESET")

func _move_when_invisible() -> void:
	if $VisibleOnScreenNotifier2D.is_on_screen():
		if not has_timer_started and not was_caught:
			$Timer.start()
			has_timer_started = true
	else:
		$AnimationPlayer.play("hidder_anim")
		has_timer_started = false
#endregion

func interact() -> void:
	if (is_a_hidder):
		if was_caught:
			return
		was_caught = true
		
		$AudioStreamPlayer.play()
		if $Timer.is_stopped() == false:
			$Timer.stop()
		
		$"Hidden Sprite".visible = false
		$"Trash Sprite".visible = true
		
		$AnimationPlayer.play("disappear")
		
		await $AnimationPlayer.animation_finished
		
		minigame_3.emit_signal("on_trash_caught")
		queue_free()
