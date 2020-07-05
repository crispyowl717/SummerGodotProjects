extends Control

onready var _Introduction = $Introduction
func _ready() -> void:
	_Introduction.play("SplashScreenAnimation")
	yield(_Introduction, "animation_finished")
	var _sceneErr = get_tree().change_scene("res://Scenes/UI/IntroScreen.tscn")
	pass
