extends AudioStreamPlayer
signal timeout

var time = 0

func _process(delta: float) -> void:
	time += delta
	if time > 0.62:
		if GlobalPlayer.G_CurrentMoveState == GlobalPlayer.E_PlayerMovementState.STATE_IDLE:
			stop()
		else:
			play(0.53)
		emit_signal("timeout")
		time = 0
	pass
