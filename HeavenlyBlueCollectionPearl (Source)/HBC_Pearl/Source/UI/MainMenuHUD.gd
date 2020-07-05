extends CanvasLayer


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/MainGame.tscn")
	pass

func _on_Quit_pressed():
	get_tree().quit()
	
