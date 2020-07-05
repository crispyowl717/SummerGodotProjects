extends Control

var time = 0
onready var _VideoPlayer = $VideoPlayer
onready var _Foreground = $Foreground

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	time += delta
	if time > 11.5:
		_Foreground.visible = true
		pass
	if time > 15:
		var _sceneErr = get_tree().change_scene("res://Scenes/Misc/MainScreen.tscn")
		pass
	pass
