extends Node


enum E_PlayerMovementState { STATE_IDLE, STATE_WALIKING }
var G_CurrentMoveState

enum E_PlayerDirection { STATE_UP, STATE_UP_RIGHT, STATE_RIGHT, STATE_DOWN_RIGHT, STATE_DOWN, STATE_DOWN_LEFT, STATE_LEFT, STATE_UP_LEFT }
var G_CurrentPlayerDirection

var IsFlipped = false
var CanMove = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass 


func _process(_delta: float) -> void:
	if Input.is_action_just_released("ui_end"):
		get_tree().quit()
		pass
	if Input.is_action_just_released("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		pass
	pass
