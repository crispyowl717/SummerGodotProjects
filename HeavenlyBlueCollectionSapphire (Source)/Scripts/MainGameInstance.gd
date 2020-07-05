extends Node

onready var _LevelCinematicPlayer = $LevelCinematicPlayer
onready var _ViewportContainer = $ViewportContainer

func _ready() -> void:

	_ViewportContainer.visible = false
	get_tree().get_root().set_disable_input(true)
	GlobalPlayer.CanMove = false

	_LevelCinematicPlayer.play("FadeIn")
	yield(_LevelCinematicPlayer, "animation_finished")

	_ViewportContainer.visible = true
	get_tree().get_root().set_disable_input(false)
	GlobalPlayer.CanMove = true

	pass
