extends CanvasLayer

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

onready var _SongSelectionNode = $SongSelectionNode
onready var _BackgroundColor = $BackgroundColor
onready var _AlbumCover = $SongSelectionNode/CoverRegion/AlbumCover
onready var _ArtistName = $SongSelectionNode/ArtistName
onready var _SongName = $SongSelectionNode/SongName
onready var _Difficulty = $SongSelectionNode/Difficulty
onready var _SnippetPlayer = $SongSelectionNode/SnippetPlayer

onready var _SpecialInstructions = $SongSelectionNode/SpecialInstructions

onready var _TopBox = $SongSelectionNode/TopBox
onready var _BottomBox = $SongSelectionNode/BottomBox

onready var _PrevAlbum = $SongSelectionNode/CoverRegion/PrevAlbum
onready var _NextAlbum = $SongSelectionNode/CoverRegion/NextAlbum

onready var _CoverRegion = $SongSelectionNode/CoverRegion
onready var _Tween = $Tween
onready var _Tween2 = $Tween2
onready var _Conductor = $SongSelectionNode/Conductor

var OpacityA = Color(1,1,1,0)
var OpacityB = Color(1,1,1,1)
var OpacityC = Color(1,1,1,0.55)

var BackgroundColorA = Color(1,1,1,1)
var BackgroundColorB = Color("#ffd571")

var CurrentArtistNameColor = Color(1,1,1,1)
var CurrentSongNameColor = Color(1,1,1,1)
var CurrentDifficultyColor = Color(1,1,1,1)

var PreviousArtistNameColor = Color(1,1,1,1)
var PreviousSongNameColor = Color(1,1,1,1)
var PreviousDifficultyColor = Color(1,1,1,1)

var CurrentFrame = 0
var CurrentSong = Song0Audio

var Time = 0
var MoveLeft = false

func _ready() -> void:
	CurrentArtistNameColor = Color("#bbd196")
	CurrentSongNameColor = Color("#56556e")
	CurrentDifficultyColor = Color("#bbd196")

	_SongSelectionNode.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	_changeSong()
	_playTween()
	
	pass

func _process(_delta: float) -> void:

	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("left") && GlobalPlayer.CurrentSong > 0:
		GlobalPlayer.CurrentSong -= 1
		CurrentFrame -= 1
		MoveLeft = true
		_changeSong()
		_playTween()

	elif Input.is_action_just_pressed("right") && GlobalPlayer.CurrentSong < 20:
		GlobalPlayer.CurrentSong += 1
		CurrentFrame += 1
		MoveLeft = false
		_changeSong()
		_playTween()
	
	elif Input.is_action_just_pressed("Select"):
		GlobalPlayer.CurrentBackgroundColor = BackgroundColorB
		get_tree().change_scene("res://Bonus/Scenes/Viewports/GameViewport.tscn")

	
func _changeSong() -> void:

	match GlobalPlayer.CurrentSong:
		0:
			CurrentSong = Song0Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#84a98c")
			
			_ArtistName.text = "NONAME"
			_SongName.text = "SONG 33"
			_Difficulty.bbcode_text = "[right]EASY ONE![/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#f7e7bd")
			CurrentSongNameColor = Color("#d9c6a5")
			CurrentDifficultyColor = Color("#98ff98")
			
			GlobalPlayer.CurrentBPM = 88
			pass
		1:
			CurrentSong = Song1Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#262626")
			
			_ArtistName.text = "MAC DEMARCO"
			_SongName.text = "MY KIND OF WOMAN"
			_Difficulty.bbcode_text = "[right]EASY ONE![/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ffd571")
			CurrentSongNameColor = Color("#bbd196")
			CurrentDifficultyColor = Color("#98ff98")

			GlobalPlayer.CurrentBPM = 92
		2: 
			CurrentSong = Song2Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#dddddd")
			
			_ArtistName.text = "NICKI MINAJ"
			_SongName.text = "NEW BODY"
			_Difficulty.bbcode_text = "[right]EASY ONE![/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#89c9b8")
			CurrentSongNameColor = Color("#84a9ac")
			CurrentDifficultyColor = Color("#98ff98")

			GlobalPlayer.CurrentBPM = 99
		3: 
			CurrentSong = Song3Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#1a1e22")
			
			_ArtistName.text = "YELLOW DAYS"
			_SongName.text = "A LITTLE WHILE"
			_Difficulty.bbcode_text = "[right]EASY ONE![/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#84a98c")
			CurrentSongNameColor = Color("#98ff98")
			CurrentDifficultyColor = Color("#98ff98")

			GlobalPlayer.CurrentBPM = 100
		4: 
			CurrentSong = Song4Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#393537")
			
			_ArtistName.text = "RUBY EMPRESS"
			_SongName.text = "STRUNG OUT"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ffc1f3")
			CurrentSongNameColor = Color("#fce2ce")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 100
		5: 
			CurrentSong = Song5Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#071d07")
			
			_ArtistName.text = "NO VACATION"
			_SongName.text = "LOVEFOOL"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#fdcb9e")
			CurrentSongNameColor = Color("#00b7c2")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 104
		6: 
			CurrentSong = Song6Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#050b1e")
			
			_ArtistName.text = "THE NEIGHBOURHOOD"
			_SongName.text = "SCARY LOVE"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#cf1b1b")
			CurrentSongNameColor = Color("#ffdbc5")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 112
		7: 
			CurrentSong = Song7Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#84a98c")
			
			_ArtistName.text = "FOSTER THE PEOPLE"
			_SongName.text = "CALL IT WHAT YOU WANT"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ffd5cd")
			CurrentSongNameColor = Color("#efbbcf")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 113
		8: 
			CurrentSong = Song8Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#393537")
			
			_ArtistName.text = "BILLIE EILISH"
			_SongName.text = "ILOMILO"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#b0cac7")
			CurrentSongNameColor = Color("#f7d6bf")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 120
		9: 
			CurrentSong = Song9Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#4e0000")
			
			_ArtistName.text = "BOOM CLAP BACHELORS"
			_SongName.text = "TIDEN FLYVER"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ffcb8e")
			CurrentSongNameColor = Color("#f5efef")
			CurrentDifficultyColor = Color("#FDFD96")
			
			GlobalPlayer.CurrentBPM = 123
		10: 
			CurrentSong = Song10Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#4a364a")
			
			_ArtistName.text = "SZA"
			_SongName.text = "ADVIL"
			_Difficulty.bbcode_text = "[right]YOU'LL BE AIGHT[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#86c4ba")
			CurrentSongNameColor = Color("#f3f3f3")
			CurrentDifficultyColor = Color("#FDFD96")

			GlobalPlayer.CurrentBPM = 120
		11: 
			CurrentSong = Song11Audio

			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#393537")
			
			_ArtistName.text = "ARCTIC MONKEYS"
			_SongName.text = "505"
			_Difficulty.bbcode_text = "[right]PRETTY HARD NGL[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#4b5d67")
			CurrentSongNameColor = Color("#87556f")
			CurrentDifficultyColor = Color("#ff6961")

			GlobalPlayer.CurrentBPM = 140
		12: 
			CurrentSong = Song12Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#420D09")
			
			_ArtistName.text = "RICO NASTY"
			_SongName.text = "IN THE AIR"
			_Difficulty.bbcode_text = "[right]PRETTY HARD NGL[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ffdbc5")
			CurrentSongNameColor = Color("#cf1b1b")
			CurrentDifficultyColor = Color("#ff6961")

			GlobalPlayer.CurrentBPM = 140
		13: 
			CurrentSong = Song13Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#393537")
			
			_ArtistName.text = "THE NEIGHBOURHOOD"
			_SongName.text = "LET IT GO"
			_Difficulty.bbcode_text = "[right]PRETTY HARD NGL[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#0f4c75")
			CurrentSongNameColor = Color("#bbe1fa")
			CurrentDifficultyColor = Color("#ff6961")

			GlobalPlayer.CurrentBPM = 150
		14: 
			CurrentSong = Song14Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#FDFD96")
			
			_ArtistName.text = "TRAVIS SCOTT"
			_SongName.text = "SKELETONS"
			_Difficulty.bbcode_text = "[right]PRETTY HARD NGL[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#7fdbda")
			CurrentSongNameColor = Color("#ade498")
			CurrentDifficultyColor = Color("#ff6961")

			GlobalPlayer.CurrentBPM = 148
		15: 
			CurrentSong = Song15Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#eaae5d")
			
			_ArtistName.text = "STILL WOOZY"
			_SongName.text = "FOOLSONG"
			_Difficulty.bbcode_text = "[right]GOOD LUCK G LMAO[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#84a98c")
			CurrentSongNameColor = Color("#f9f7d9")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 151
		16: 
			CurrentSong = Song16Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#852c11")
			
			_ArtistName.text = "MEG THEE STALLION"
			_SongName.text = "PIMPIN"
			_Difficulty.bbcode_text = "[right]GOOD LUCK G LMAO[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#eedad1")
			CurrentSongNameColor = Color("#d4b5b0")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 152
		17:
			CurrentSong = Song17Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#3b3b50")
			
			_ArtistName.text = "TRAVIS SCOTT"
			_SongName.text = "ASTROTHUNDER"
			_Difficulty.bbcode_text = "[right]GOOD LUCK G LMAO[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#f0ece3")
			CurrentSongNameColor = Color("#dfd3c3")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 152
		18:
			CurrentSong = Song18Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#95e995")
			
			_ArtistName.text = "DON TOLIVER"
			_SongName.text = "WASTED"
			_Difficulty.bbcode_text = "[right]GOOD LUCK G LMAO[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#eedad1")
			CurrentSongNameColor = Color("#f69e7b")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 157
		19:
			CurrentSong = Song19Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#141444")
			
			_ArtistName.text = "PLAYBOI CARTI"
			_SongName.text = "MAGNOLIA"
			_Difficulty.bbcode_text = "[right]GOOD LUCK G LMAO[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#ff847c")
			CurrentSongNameColor = Color("#e84a5f")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 163
		20:
			CurrentSong = Song20Audio
			BackgroundColorA = _BackgroundColor.color
			BackgroundColorB = Color("#351a07")
			
			_ArtistName.text = "THE CARTERS"
			_SongName.text = "APES***"
			_Difficulty.bbcode_text = "[right]nice[/right]"
			
			PreviousArtistNameColor = _ArtistName.get_color("default_color")
			PreviousSongNameColor = _SongName.get_color("default_color")
			PreviousDifficultyColor = _Difficulty.get_color("default_color")
			
			CurrentArtistNameColor = Color("#322f3d")
			CurrentSongNameColor = Color("#4b5d67")
			CurrentDifficultyColor = Color("#990000")

			GlobalPlayer.CurrentBPM = 160
	_SnippetPlayer.play()
	pass

func _playTween() -> void:

	_Conductor.stream = CurrentSong
	_Conductor.bpm = GlobalPlayer.CurrentBPM
	_Conductor.play_with_beat_offset(8)

	_Tween.interpolate_property(_TopBox, "rect_size:y",
	0, 185, (1.5/2),
	Tween.TRANS_QUAD, Tween.EASE_OUT)

	_Tween.interpolate_property(_BottomBox, "rect_size:y",
	0, 185, (1.5/2),
	Tween.TRANS_QUAD, Tween.EASE_OUT)

	_Tween.interpolate_property(_Difficulty, "rect_position:x",
		760, -9, (1.5/2),
		Tween.TRANS_QUAD, Tween.EASE_IN)
	_Tween.interpolate_property(_ArtistName, "rect_position:x",
		-500, 56, (1.5/2),
		Tween.TRANS_QUAD, Tween.EASE_OUT)
	_Tween.interpolate_property(_SongName, "rect_position:x",
		-500, 56, (1.1/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.interpolate_property(_SpecialInstructions, "rect_position:y",
		1112, 1045, (1.1/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)

	if !MoveLeft:
		_Tween.interpolate_property(_CoverRegion, "rect_position:x",
			80, 0, (1.1/2.5),
			Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	else:
		_Tween.interpolate_property(_CoverRegion, "rect_position:x",
			-80, 0, (1.1/2.5),
			Tween.TRANS_QUAD, Tween.EASE_IN_OUT)

	_Tween.interpolate_property(_AlbumCover, "modulate",
		OpacityA, OpacityB, (1.7/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.interpolate_property(_PrevAlbum, "modulate",
		OpacityA, OpacityC, (1.8/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.interpolate_property(_NextAlbum, "modulate",
		OpacityA, OpacityC, (1.9/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.interpolate_property(_SpecialInstructions, "modulate",
		OpacityA, OpacityB, (1.85/2),
		Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	_Tween.interpolate_property(_BackgroundColor, "color",
		BackgroundColorA, BackgroundColorB, 0.25,
		Tween.TRANS_QUAD, Tween.EASE_IN)
		
	_Tween.interpolate_property(_ArtistName, "custom_colors/default_color",
		PreviousArtistNameColor, CurrentArtistNameColor, 0.45,
		Tween.TRANS_QUAD, Tween.EASE_IN)
	_Tween.interpolate_property(_SongName, "custom_colors/default_color",
		PreviousSongNameColor, CurrentSongNameColor, 0.85,
		Tween.TRANS_QUAD, Tween.EASE_IN)
	_Tween.interpolate_property(_Difficulty.get_font("normal_font"), "outline_color",
		PreviousDifficultyColor, CurrentDifficultyColor, 0.75,
		Tween.TRANS_QUAD, Tween.EASE_IN)

	if CurrentFrame > 0:
		_PrevAlbum.visible = true
		_PrevAlbum.frame = CurrentFrame - 1
	else:
		_PrevAlbum.visible = false

	if CurrentFrame < 19:
		_NextAlbum.visible = true
		_NextAlbum.frame = CurrentFrame + 1
	else:
		_NextAlbum.visible = false
		

	_AlbumCover.frame = CurrentFrame
	_SnippetPlayer.stream = CurrentSong
		
	
	_Tween.start()
	pass


func _on_Conductor_beat(_position) -> void:
	_Tween2.interpolate_property(_BackgroundColor, "color",
		BackgroundColorB, Color(BackgroundColorB.r, BackgroundColorB.g, BackgroundColorB.b, (GlobalPlayer.CurrentBPM/6)),
		Tween.TRANS_QUAD, Tween.EASE_IN)

		
	_Tween2.interpolate_property(_AlbumCover, "position",
		Vector2(960,540), Vector2(960,500), (GlobalPlayer.CurrentBPM/3),
		Tween.TRANS_BOUNCE, Tween.EASE_IN)
	_Tween2.start()
	pass


func _on_Tween2_tween_completed(_object: Object, _key: NodePath) -> void:
	_Tween2.interpolate_property(_BackgroundColor, "color",
		BackgroundColorB, Color(BackgroundColorB.r, BackgroundColorB.g, BackgroundColorB.b, (GlobalPlayer.CurrentBPM/6)),
		Tween.TRANS_QUAD, Tween.EASE_IN)

	_Tween2.interpolate_property(_AlbumCover, "position",
		Vector2(960,500), Vector2(960,400), (GlobalPlayer.CurrentBPM/3),
		Tween.TRANS_BOUNCE, Tween.EASE_IN)
	_Tween2.start()
	pass


func _on_Tween2_tween_started(object: Object, key: NodePath) -> void:
	pass # Replace with function body.
