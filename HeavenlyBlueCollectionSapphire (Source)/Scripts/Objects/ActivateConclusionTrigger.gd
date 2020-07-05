extends Area


onready var _Player = $"../../Player"


func _physics_process(_delta: float) -> void:
	if overlaps_body(_Player):
		var _sceneErr = get_tree().change_scene("res://Scenes/General/ConclusionScreen.tscn")
