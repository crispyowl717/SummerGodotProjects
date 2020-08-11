extends Node

var EnableInput: bool = false

var CurrentSong = 0
var CurrentBackgroundColor
var CurrentArtistName = ""
var CurrentSongSnippet = ""
var CurrentAlbumCoverPath = ""
var CurrentBPM = 88

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	EnableInput = false
	pass 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	pass
