extends Control

onready var _InteractionName = $InteractionName
onready var _InteractionResponse = $InteractionResponse

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	match GlobalUi.CurrentRoomState:
		GlobalUi.Rooms.STATE_INACTIVE:
			_InteractionName.bbcode_text = ""
			_InteractionResponse.bbcode_text = ""
			GlobalUi.UI_Visible = false
			pass
		GlobalUi.Rooms.STATE_MOM:
			_InteractionName.bbcode_text = "[center]Mom's Room[/center]"
			_InteractionResponse.bbcode_text = "[center]Door Locked[/center]"
			GlobalUi.UI_Visible = true
			pass
		GlobalUi.Rooms.STATE_SISTER:
			_InteractionName.bbcode_text = "[center]Sister's Room[/center]"
			_InteractionResponse.bbcode_text = "[center]Door Locked[/center]"
			GlobalUi.UI_Visible = true
			pass
		GlobalUi.Rooms.STATE_MY_ROOM:
			_InteractionName.bbcode_text = "[center]My Room[/center]"
			_InteractionResponse.bbcode_text = "[center]...[/center]"
			GlobalUi.UI_Visible = true
			pass
	pass
	visible = GlobalUi.UI_Visible
