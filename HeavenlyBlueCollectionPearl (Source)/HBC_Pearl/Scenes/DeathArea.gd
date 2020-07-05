extends Node2D

func _on_Area2D_body_entered(body: Node) -> void:
	if(body.get_name() == "Player"):
		get_tree().change_scene("res://Scenes/EndingScreen.tscn")
