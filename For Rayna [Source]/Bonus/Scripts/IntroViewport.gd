extends Viewport

onready var _SplashScreen = $SplashScreen
onready var _SplashScreenAnimationPlayer = $SplashScreen/AnimationPlayer

onready var _ControlsScreen = $ControlsScreen
onready var __ControlsScreenAnimationPlayer = $ControlsScreen/AnimationPlayer

onready var _AudioPlayer = $AudioPlayer

var Timer: float = 0.0

enum ViewportState {Splash, Controls}
var CurrentViewportState 

func _ready() -> void:
	_AudioPlayer.play()
	_SplashScreen.visible = true
	_ControlsScreen.visible = false
	GlobalPlayer.EnableInput = false
	CurrentViewportState = ViewportState.Splash
	_SplashScreenAnimationPlayer.play("IntroAnimation")		
	pass 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
	pass

func _on_AnimationPlayerSplash_animation_finished(anim_name: String) -> void:
	if anim_name == "IntroAnimation":
		_ControlsScreen.visible = true
		_SplashScreen.visible = false
		__ControlsScreenAnimationPlayer.play("FadeIn")		
		pass
	
func _on_AnimationPlayerControls_animation_finished(anim_name: String) -> void:
	if anim_name == "FadeIn":
		GlobalPlayer.EnableInput = true
		pass

	if anim_name == "FadeOut":
		var _Return = get_tree().change_scene("res://Bonus/Scenes/Screens/SongSelectionScreen.tscn")
		pass
