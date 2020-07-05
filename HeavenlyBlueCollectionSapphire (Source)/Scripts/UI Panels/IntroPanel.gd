extends Control

signal timeout
var time = 0

enum PanelState { STATE_W, STATE_S, STATE_A, STATE_D, STATE_LEFT, STATE_RIGHT, STATE_PROCEED }
var currentInputCheck = PanelState.STATE_W

onready var _BassNoise = $BassNoise
onready var _InputName = $InputName
onready var _KeyboardKey = $KeyboardKey
onready var _GamepadKey = $GamepadKey

onready var _FadeToBlackAnimation = $FadeToBlackAnimation
onready var _TitleScreen = $TitleScreen

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	ValidateInput()
	ProcessState(delta)
	pass

func ValidateInput() -> void:
	match currentInputCheck:
		PanelState.STATE_W:
			if Input.is_action_just_released("ui_up"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
		PanelState.STATE_S:
			if Input.is_action_just_released("ui_down"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
		PanelState.STATE_A:
			if Input.is_action_just_released("ui_left"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
		PanelState.STATE_D:
			if Input.is_action_just_released("ui_right"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
		PanelState.STATE_LEFT:
			if Input.is_action_just_released("ui_camera_left"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
		PanelState.STATE_RIGHT:
			if Input.is_action_just_released("ui_camera_right"):
				currentInputCheck += 1
				_BassNoise.play()
			pass
	pass

func ProcessState(delta) -> void:
	match currentInputCheck:
		PanelState.STATE_W:
			_KeyboardKey.visible = true
			_GamepadKey.visible = true
			_InputName.bbcode_text = "[center]Move Forward[/center]"
			_KeyboardKey.frame = 5
			_GamepadKey.frame = 5
			pass
		PanelState.STATE_S:
			_InputName.bbcode_text = "[center]Move Backward[/center]"
			_KeyboardKey.frame = 4
			_GamepadKey.frame = 2
			pass	
		PanelState.STATE_A:
			_InputName.bbcode_text = "[center]Move Left[/center]"
			_KeyboardKey.frame = 0
			_GamepadKey.frame = 3
			pass
		PanelState.STATE_D:
			_InputName.bbcode_text = "[center]Move Right[/center]"
			_KeyboardKey.frame = 1
			_GamepadKey.frame = 4
			pass
		PanelState.STATE_LEFT:
			_InputName.bbcode_text = "[center]Peek Left[/center]"
			_KeyboardKey.frame = 2
			_GamepadKey.frame = 1
			pass
		PanelState.STATE_RIGHT:
			_InputName.bbcode_text = "[center]Peek Right[/center]"
			_KeyboardKey.frame = 3
			_GamepadKey.frame = 0
			pass
		PanelState.STATE_PROCEED:
			_InputName.bbcode_text = ""
			_KeyboardKey.visible = false
			_GamepadKey.visible = false
			_TitleScreen.visible = true
			HandleTransition(delta)
			pass
	pass

func HandleTransition(delta):
	time += delta
	if time > 3:		
		emit_signal("timeout")
		_FadeToBlackAnimation.play("FadeToBlackAnimation", 0)
		var _sceneErr = get_tree().change_scene("res://Scenes/General/TextMessageScene.tscn")
	pass
