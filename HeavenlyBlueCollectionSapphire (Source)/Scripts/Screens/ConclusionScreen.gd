extends Control

var time = 0
var audioToggled = false
onready var _AudioStreamPlayer = $AudioStreamPlayer

var _VideoPlayer = load("res://Game Objects/ConclusionVideoPlayer.tscn")
var VideoPlayerInstanec = _VideoPlayer.instance()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	time += delta
	if time > 3 and not audioToggled:
		add_child(VideoPlayerInstanec)
		_AudioStreamPlayer.play()
		audioToggled = true
		pass
	if time > 40:
		get_tree().quit()
		pass
	pass