extends Area

signal timeout
var time = 0

enum Rooms { STATE_INACTIVE, STATE_MOM, STATE_SISTER, STATE_MY_ROOM }
export(Rooms) var CurrentRoom

onready var _Player = $"../Player"

func _physics_process(delta: float) -> void:
	if overlaps_body(_Player):
		time = 0
		match CurrentRoom:
			GlobalUi.Rooms.STATE_MOM:
				GlobalUi.CurrentRoomState = GlobalUi.Rooms.STATE_MOM
				pass
			GlobalUi.Rooms.STATE_SISTER:
				GlobalUi.CurrentRoomState = GlobalUi.Rooms.STATE_SISTER
				pass
			GlobalUi.Rooms.STATE_MY_ROOM:
				GlobalUi.CurrentRoomState = GlobalUi.Rooms.STATE_MY_ROOM
				pass
		pass
	else:
		time += delta
		if time > 1.0:
			GlobalUi.CurrentRoomState = GlobalUi.Rooms.STATE_INACTIVE	
			emit_signal("timeout")
			time = 0
