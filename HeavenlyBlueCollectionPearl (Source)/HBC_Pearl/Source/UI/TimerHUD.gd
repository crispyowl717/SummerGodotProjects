extends Control

onready var _TimeText = $Border/TimeText
var time = 0

func _process(delta):
	time += delta 
	_TimeText.text = String(int(time))
