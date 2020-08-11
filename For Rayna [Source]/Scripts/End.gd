extends Node2D


func _ready():
	$GradeNumber.text = Global.grade
	$ScoreNumber.text = str(Global.score)
	$ComboNumber.text = str(Global.combo)
	$GreatNumber.text = str(Global.great)
	$GoodNumber.text = str(Global.good)
	$OkayNumber.text = str(Global.okay)
	$MissedNumber.text = str(Global.missed)
	visible = true
	


func _on_PlayAgain_pressed():
	if get_tree().change_scene("res://Bonus/Scenes/Viewports/GameViewport.tscn") != OK:
			print ("Error changing scene to Game")


func _on_BackToMenu_pressed():
	GlobalPlayer.CurrentSong = 0

	if get_tree().change_scene("res://Bonus/Scenes/Screens/SongSelectionScreen.tscn") != OK:
			print ("Error changing scene to Menu")
