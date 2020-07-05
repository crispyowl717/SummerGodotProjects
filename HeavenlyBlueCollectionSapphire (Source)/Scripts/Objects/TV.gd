extends Area


onready var _Player = $"../../Player"
onready var _TVAudio = $"../TV Audio"
onready var _Screen = $"../Screen"

var firstTrigger = false

func _ready() -> void:
	_Screen.visible = false
	pass

func _physics_process(_delta: float) -> void:
	if overlaps_body(_Player) and not firstTrigger:
		_TVAudio.play(0.5)
		_Screen.visible = true
		firstTrigger = true
