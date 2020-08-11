extends Control

onready var _TopBlackBar = $TopBlackBar
onready var _HeaderText = $TopBlackBar/HeaderText
onready var _BottomBlackBar = $BottomBlackBar
onready var _Cursor = $Cursor

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	_HeaderText.bbcode_text = "[center]SCORE:" + String(GetWorld.CurrentGameScore) + \
	"//COMBO:" + String(GetWorld.CurrentGameCombo) + "[/center]"
	pass
