extends Node2D

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = GlobalPlayer.CurrentBPM

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var instance
var CurrentVolume = 0.0

var Song0Audio = load("res://Bonus/Assets/Music/GameTracks/Level 1/Full/1_Song33_88.ogg")
var Song1Audio = load("res://Bonus/Assets/Music/GameTracks/Level 1/Full/2_MyKindOfWoman_92.ogg")
var Song2Audio = load("res://Bonus/Assets/Music/GameTracks/Level 1/Full/3_NewBody_99.ogg")
var Song3Audio = load("res://Bonus/Assets/Music/GameTracks/Level 1/Full/4_ALittleWhile_100.ogg")
var Song4Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/5_StrungOut_104.ogg")
var Song5Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/6_Lovefool_104.ogg")
var Song6Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/7_ScaryLove_112.ogg")
var Song7Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/8_CallItWhatYouWant_113.ogg")
var Song8Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/9_Ilomilo_120.ogg")
var Song9Audio = load("res://Bonus/Assets/Music/GameTracks/Level 2/Full/10_TidenFlyver_123.ogg")
var Song10Audio = load("res://Bonus/Assets/Music/GameTracks/Level 3/Full/11_Advil_120.ogg")
var Song11Audio = load("res://Bonus/Assets/Music/GameTracks/Level 3/Full/12_505_140.ogg")
var Song12Audio = load("res://Bonus/Assets/Music/GameTracks/Level 3/Full/13_InTheAir_140.ogg")
var Song13Audio = load("res://Bonus/Assets/Music/GameTracks/Level 3/Full/14_LetItGo_150.ogg")
var Song14Audio = load("res://Bonus/Assets/Music/GameTracks/Level 3/Full/15_Skeletons_148.ogg")
var Song15Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/16_Foolsong_151.ogg")
var Song16Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/17_Pimpin_152.ogg")
var Song17Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/18_Astrothunder_152.ogg")
var Song18Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/19_Wasted_157.ogg")
var Song19Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/20_Magnolia_163.ogg")
var Song20Audio = load("res://Bonus/Assets/Music/GameTracks/Level 4/Full/21_APESHIT_160.ogg")

var CanDoItAgain = false

func _ready():
	randomize()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	match GlobalPlayer.CurrentSong:
		0:
			$Conductor.stream = Song0Audio
		1:
			$Conductor.stream = Song1Audio
		2:
			$Conductor.stream = Song2Audio
		3:
			$Conductor.stream = Song3Audio
		4:
			$Conductor.stream = Song4Audio
		5:
			$Conductor.stream = Song5Audio
		6:
			$Conductor.stream = Song6Audio
		7:
			$Conductor.stream = Song7Audio
		8:
			$Conductor.stream = Song8Audio
		9:
			$Conductor.stream = Song9Audio
		10:
			$Conductor.stream = Song10Audio
		11:
			$Conductor.stream = Song11Audio
		12:
			$Conductor.stream = Song12Audio
		13:
			$Conductor.stream = Song13Audio
		14:
			$Conductor.stream = Song14Audio
		15:
			$Conductor.stream = Song15Audio
		16:
			$Conductor.stream = Song16Audio
		17:
			$Conductor.stream = Song17Audio
		18:
			$Conductor.stream = Song18Audio
		19:
			$Conductor.stream = Song19Audio
		20:
			$Conductor.stream = Song20Audio

	bpm = GlobalPlayer.CurrentBPM
	sec_per_beat = 60.0 / bpm
	$Conductor.bpm = GlobalPlayer.CurrentBPM
	$Conductor.play_with_beat_offset(0)

func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 64:	
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 98:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 132:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 162:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 228:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 258:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 322:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 388:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 396:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 2

func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
		

func _process(delta: float) -> void:
	if combo > 0:
		CurrentVolume = -5
	if combo > 10:
		CurrentVolume = -1
	if combo > 20:
		CurrentVolume = 2.5
	if combo > 35:
		CurrentVolume = 3.2
	if combo > 50:
		CurrentVolume = 4.5
	if combo > 100:
		CurrentVolume = 5.3	
	
	if Input.is_action_just_pressed("Quit"):
		Global.set_score(score)
		Global.combo = max_combo
		Global.great = great
		Global.good = good
		Global.okay = okay
		Global.missed = missed
		get_tree().change_scene("res://Scenes/End2.tscn")
		
	$Conductor.volume_db = lerp($Conductor.volume_db, CurrentVolume, delta*3)
	pass

func increment_score(by):
	if by > 0:
		combo += 1
	else:
		combo = 0
	
	if by == 3:
		great += 1
	elif by == 2:
		good += 1
	elif by == 1:
		okay += 1
	else:
		missed += 1

	score += by * combo
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""

func reset_combo():
	combo = 0
	$Combo.text = ""


func _on_Conductor_finished() -> void:
	Global.set_score(score)
	Global.combo = max_combo
	Global.great = great
	Global.good = good
	Global.okay = okay
	Global.missed = missed
	get_tree().change_scene("res://Scenes/End2.tscn")
	pass


func _on_Timer_timeout() -> void:
	pass # Replace with function body.


func _on_Bass_finished() -> void:
	pass 
