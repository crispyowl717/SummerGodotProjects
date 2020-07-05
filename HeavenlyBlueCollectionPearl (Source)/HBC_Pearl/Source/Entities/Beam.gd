extends Node2D

signal timeout

const TIME_PERIOD = 5 
var time = 0

onready var _Area2D = $Area2D
onready var _Spawner = $Area2D

var multiplier = 15

func _process(delta: float) -> void:
	self.position += Vector2.RIGHT * multiplier * delta
	time += delta
	if time > TIME_PERIOD:
		multiplier *= 1.45
		time = 0
		emit_signal("timeout")

func _on_Area2D_body_entered(body: Node) -> void:
	if(body.get_name() == "Player"):
		get_tree().change_scene("res://Scenes/EndingScreen.tscn")
