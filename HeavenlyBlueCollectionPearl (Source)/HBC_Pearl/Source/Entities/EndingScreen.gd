extends Node2D

signal timeout

const TIME_PERIOD = 2.5
var time = 0
onready var _Animation = $AnimationPlayer

func _ready():
	_Animation.play("SplashScreen")

func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		emit_signal("timeout")
		get_tree().quit()

