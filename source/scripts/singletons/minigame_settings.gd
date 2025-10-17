extends Node

signal start_signal

var minigame_1_score: int = 0

func minigame_start() -> void:
	emit_signal("start_signal")
