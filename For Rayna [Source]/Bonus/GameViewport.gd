extends ViewportContainer

onready var _AnimationPlayer = $Viewport/AnimationPlayer
onready var _ColorRect = $Viewport/ColorRect

onready var _Tween = $Viewport/Tween
onready var _Conductor = $Viewport/Conductor

func _ready() -> void:
	_ColorRect.color = GlobalPlayer.CurrentBackgroundColor
	_AnimationPlayer.play("FadeIn")
	
	var sec_per_beat = 60.0 / GlobalPlayer.CurrentBPM
	_Conductor.bpm = GlobalPlayer.CurrentBPM
	_Conductor.play_with_beat_offset(8)
	pass


func _on_Conductor_beat(_position) -> void:
	_Tween.interpolate_property(_ColorRect, "color",
		GlobalPlayer.CurrentBackgroundColor, Color(GlobalPlayer.CurrentBackgroundColor.r, \
		GlobalPlayer.CurrentBackgroundColor.g, GlobalPlayer.CurrentBackgroundColor.b, (GlobalPlayer.CurrentBPM/3)),
		Tween.TRANS_QUAD, Tween.EASE_IN)
	_Tween.start()
	pass


func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	_Tween.interpolate_property(_ColorRect, "color",
		GlobalPlayer.CurrentBackgroundColor, Color(GlobalPlayer.CurrentBackgroundColor.r, \
		GlobalPlayer.CurrentBackgroundColor.g, GlobalPlayer.CurrentBackgroundColor.b, (GlobalPlayer.CurrentBPM/3)),
		Tween.TRANS_QUAD, Tween.EASE_OUT)
	_Tween.start()
	pass
