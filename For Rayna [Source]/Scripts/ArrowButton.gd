extends AnimatedSprite

var perfect = false
var good = false
var okay = false
var current_note = null

export var input = ""
var inCorrectSpace = false

func _input(event: InputEvent) -> void: 
	
	if event.is_action(input):
		if event.is_action_pressed(input, false):
			frame = 1
			inCorrectSpace = false
		elif event.is_action_released(input):
			inCorrectSpace = true
			$PushTimer.start()


	if event.is_action("Select") and !inCorrectSpace:
		if event.is_action_pressed("Select"):
			if current_note != null:
				if perfect:
					get_parent().increment_score(3)
					current_note.destroy(3)
				elif good:
					get_parent().increment_score(2)
					current_note.destroy(2)
				elif okay:
					get_parent().increment_score(1)
					current_note.destroy(1)
				_reset()
			else:
				get_parent().increment_score(0)


func _on_PerfectArea_area_entered(area):
	if area.is_in_group("note"):
		perfect = true


func _on_PerfectArea_area_exited(area):
	if area.is_in_group("note"):
		perfect = false


func _on_GoodArea_area_entered(area):
	if area.is_in_group("note"):
		good = true


func _on_GoodArea_area_exited(area):
	if area.is_in_group("note"):
		good = false


func _on_OkayArea_area_entered(area):
	if area.is_in_group("note"):
		okay = true
		current_note = area


func _on_OkayArea_area_exited(area):
	if area.is_in_group("note"):
		okay = false
		current_note = null


func _on_PushTimer_timeout():
	frame = 0


func _reset():
	current_note = null
	perfect = false
	good = false
	okay = false
