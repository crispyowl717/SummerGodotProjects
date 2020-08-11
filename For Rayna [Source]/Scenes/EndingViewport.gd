extends Viewport

onready var _Black = $Black
onready var _End = $End
onready var _AudioStream = $AudioStreamPlayer
onready var _Tween = $Tween

var Song0Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 1/Snippet/1_Song33_Snippet.ogg")
var Song1Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 1/Snippet/2_MyKindOfWoman_Snippet.ogg")
var Song2Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 1/Snippet/3_NewBody_Snippet.ogg")
var Song3Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 1/Snippet/4_ALittleWhile_Snippet.ogg")
var Song4Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/5_StrungOutSnippet.ogg")
var Song5Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/6_LovefoolSnippet.ogg")
var Song6Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/7_ScaryLoveSnippet.ogg")
var Song7Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/8_CallItWhatYouWantSlowed.ogg")
var Song8Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/9_IlomiloSnippet.ogg")
var Song9Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 2/Snippet/10_TidenFlyverSlowed.ogg")
var Song10Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 3/Snippet/11_Advil_Snippet.ogg")
var Song11Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 3/Snippet/12_505Snippet.ogg")
var Song12Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 3/Snippet/13_InTheAirSnippet.ogg")
var Song13Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 3/Snippet/14_LetItGoSnippet.ogg")
var Song14Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 3/Snippet/15_SkeletonsSnippet.ogg")
var Song15Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/16_FoolsongSnippet.ogg")
var Song16Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/17_PimpinSnippet.ogg")
var Song17Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/18_AstrothunderSnippet.ogg")
var Song18Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/19_WastedSnippet.ogg")
var Song19Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/20_MagnoliaSnippet.ogg")
var Song20Audio = preload("res://Bonus/Assets/Music/GameTracks/Level 4/Snippet/21_APESHIT_SNIPPET_160.ogg")

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_Black.color = GlobalPlayer.CurrentBackgroundColor
	match GlobalPlayer.CurrentSong:
		0:
			_AudioStream.stream = Song0Audio
		1:
			_AudioStream.stream = Song1Audio
		2:
			_AudioStream.stream = Song2Audio
		3:
			_AudioStream.stream = Song3Audio
		4:
			_AudioStream.stream = Song4Audio
		5:
			_AudioStream.stream = Song5Audio
		6:
			_AudioStream.stream = Song6Audio
		7:
			_AudioStream.stream = Song7Audio
		8:
			_AudioStream.stream = Song8Audio
		9:
			_AudioStream.stream = Song9Audio
		10:
			_AudioStream.stream = Song10Audio
		11:
			_AudioStream.stream = Song11Audio
		12:
			_AudioStream.stream= Song12Audio
		13:
			_AudioStream.stream = Song13Audio
		14:
			_AudioStream.stream = Song14Audio
		15:
			_AudioStream.stream= Song15Audio
		16:
			_AudioStream.stream = Song16Audio
		17:
			_AudioStream.stream = Song17Audio
		18:
			_AudioStream.stream= Song18Audio
		19:
			_AudioStream.stream = Song19Audio
		20:
			_AudioStream.stream = Song20Audio

	_Tween.interpolate_property(_End, "modulate",
		Color(1,1,1,0), Color(1,1,1,1), (1.7/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.start()
	pass


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	if object == _End:
		_AudioStream.play()
	pass 
