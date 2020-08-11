extends Control

enum InstructionState {Left, Up, Right, Select, TransitionToGame}
var CurrentInstructionState = InstructionState.Left

onready var _InstructionText = $Container/InstructionText
onready var _InputBoxText = $Container/InputBoxContainer/InputBoxText
onready var _AnimationPlayer = $AnimationPlayer
onready var _PulseAudioPlayer = $"PulseAudioPlayer"
onready var _AudioPlayer = $"../AudioPlayer"

var CurrentInstructionText : String = ""
var CurrentInputBoxText : String = ""
var CurrentVolume : float = -5

var MouseInput : Vector2 = Vector2(0,0)
var Timer : float = 0.46
var PulseTimer : float = 0.36
var AbleToMakeNoiseAgain : bool = false

func _ready() -> void:
	CurrentInstructionState = InstructionState.Left
	pass 

func _process(delta: float) -> void:
	if GlobalPlayer.EnableInput == true:
		Timer += delta
		PulseTimer += delta

		_handleInstructionState()
		if CurrentInstructionState != InstructionState.TransitionToGame:
			_AudioPlayer.volume_db = lerp(_AudioPlayer.volume_db, CurrentVolume, delta * 25)

		_InstructionText.bbcode_text = "[center]" + String(CurrentInstructionText) + "[/center]"
		_InputBoxText.bbcode_text = "[center]" + String(CurrentInputBoxText) + "[/center]"
	pass

func _handleInstructionState() -> void:
	match CurrentInstructionState:
		InstructionState.Left:
			CurrentVolume = -5
			CurrentInstructionText = "LEFT"
			CurrentInputBoxText = "Left Key/A"
			if Input.is_action_pressed("left"):
				CurrentInstructionState = InstructionState.Up
				_PulseAudioPlayer.pitch_scale = 1.0
				_PulseAudioPlayer.play()
				AbleToMakeNoiseAgain = false
				CurrentVolume = -2
				pass
		InstructionState.Up:
			CurrentVolume = -5
			CurrentInstructionText = "UP"
			CurrentInputBoxText = "Up Key/W"
			if Input.is_action_pressed("up") and AbleToMakeNoiseAgain:
				CurrentInstructionState = InstructionState.Right
				_PulseAudioPlayer.pitch_scale = 1.1
				_PulseAudioPlayer.play()
				AbleToMakeNoiseAgain = false
				CurrentVolume = -1
			pass
		InstructionState.Right:
			CurrentVolume = -5
			CurrentInstructionText = "RIGHT"
			CurrentInputBoxText = "Right Key/D"
			if Input.is_action_pressed("right") and AbleToMakeNoiseAgain:
				CurrentInstructionState = InstructionState.Select
				_PulseAudioPlayer.pitch_scale = 1.3
				_PulseAudioPlayer.play()
				AbleToMakeNoiseAgain = false
				CurrentVolume = 0
			pass
		InstructionState.Select:
			CurrentVolume = -5
			CurrentInstructionText = "SELECT"
			CurrentInputBoxText = "Space"
			if Input.is_action_pressed("Select") and AbleToMakeNoiseAgain:
				CurrentInstructionState = InstructionState.TransitionToGame
				_PulseAudioPlayer.pitch_scale = 2.7
				_PulseAudioPlayer.play()
				AbleToMakeNoiseAgain = false
				CurrentVolume = 1
			pass
		InstructionState.TransitionToGame:
			if AbleToMakeNoiseAgain:
				_AnimationPlayer.play("FadeOut")
			pass
	pass

func _on_PulseAudioPlayer_finished() -> void:
	AbleToMakeNoiseAgain = true
	pass
