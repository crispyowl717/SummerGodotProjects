extends Node2D

signal timeout

const TIME_PERIOD = 5 
var time = 0
onready var animation = $AnimationPlayer

func _ready():
	animation.play("SplashScreen")

func _process(delta):
	time += delta
	if time > TIME_PERIOD:
		emit_signal("timeout")
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
