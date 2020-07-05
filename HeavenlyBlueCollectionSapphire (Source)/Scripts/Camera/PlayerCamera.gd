extends Camera

var CameraTargetPosition
var CameraTargetRotation
var CameraPositionSpeed = 2
var CameraRotationSpeed = 1.5

onready var _StandingHook = $"../StandingHook"
onready var _WalkingHook = $"../WalkingHook"

func _ready() -> void:
	CameraTargetPosition = _StandingHook.transform.origin
	CameraTargetRotation = 0
	pass 


func _process(delta: float) -> void:
	match GlobalPlayer.G_CurrentMoveState:
		GlobalPlayer.E_PlayerMovementState.STATE_IDLE:
			CameraTargetPosition = _StandingHook.transform.origin
			pass
		GlobalPlayer.E_PlayerMovementState.STATE_WALIKING:
			CameraTargetPosition = _WalkingHook.transform.origin
			pass
	CheckInput()
	ChangeCameraPosition(delta)
	pass

func ChangeCameraPosition(delta):
	self.transform.origin = self.transform.origin.linear_interpolate(CameraTargetPosition, delta * CameraPositionSpeed)
	self.rotation = self.rotation.linear_interpolate(Vector3(0, CameraTargetRotation, 0), delta * CameraRotationSpeed)
	pass

func CheckInput():
	if Input.is_action_pressed("ui_camera_left"):
		CameraTargetRotation = 1.25
		pass
	elif Input.is_action_pressed("ui_camera_right"):
		CameraTargetRotation = -1.2
		pass
	else:
		CameraTargetRotation = 0.0
		pass
	pass
