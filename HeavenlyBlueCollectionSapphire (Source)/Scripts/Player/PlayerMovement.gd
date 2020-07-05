extends KinematicBody

# Movement
const ACCELERATION = 15
const MAX_SPEED = 2.35
const FRICTION = 0.45
const DAMPING = 0.1
const DEAD_ZONE = 0.05

var Velocity = Vector3.ZERO
var MovementAxisValue = Vector2.ZERO

func _ready() -> void:
	GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_UP
	GlobalPlayer.G_CurrentMoveState = GlobalPlayer.E_PlayerMovementState.STATE_IDLE
	pass 

func _physics_process(delta) -> void:
	if GlobalPlayer.CanMove:
		_processInput()
		_processMovement(delta)
		_processDirection()
	pass

func _processInput() -> void:
	MovementAxisValue.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	MovementAxisValue.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	pass 

func _processMovement(delta) -> void:

	if abs(MovementAxisValue.x) > DEAD_ZONE:
		Velocity.x += MovementAxisValue.x * ACCELERATION * delta
		Velocity.x *= pow(1 - DAMPING, delta * 10)
		Velocity.x = clamp(Velocity.x, -MAX_SPEED*0.9, MAX_SPEED*0.9)
	else:
		Velocity.x = lerp(Velocity.x, 0, FRICTION)


	if abs(MovementAxisValue.y) > DEAD_ZONE:
		Velocity.z += MovementAxisValue.y * ACCELERATION * delta
		Velocity.z *= pow(1 - DAMPING, delta * 10)
		Velocity.z = clamp(Velocity.z, -MAX_SPEED, MAX_SPEED)
	else:
		Velocity.z = lerp(Velocity.z, 0, FRICTION)

	if abs(MovementAxisValue.x) > DEAD_ZONE and abs(MovementAxisValue.y) > DEAD_ZONE:
		Velocity = move_and_slide(Velocity*0.82, Vector3.UP)
	else:
		Velocity = move_and_slide(Velocity, Vector3.UP)
	pass 

func _processDirection() -> void:

	# Currently Moving
	if abs(MovementAxisValue.x) > DEAD_ZONE or abs(MovementAxisValue.y) > DEAD_ZONE:

		GlobalPlayer.G_CurrentMoveState = GlobalPlayer.E_PlayerMovementState.STATE_WALIKING
		
		if MovementAxisValue.x > DEAD_ZONE:
			# Up Right
			if MovementAxisValue.y < -DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_UP_RIGHT
				GlobalPlayer.IsFlipped = false
				pass
			# Down Right
			elif MovementAxisValue.y > DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_DOWN_RIGHT
				GlobalPlayer.IsFlipped = false
				pass
			# Right
			else:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_RIGHT
				GlobalPlayer.IsFlipped = false
				pass
			pass
		
		if MovementAxisValue.x < -DEAD_ZONE:
			# Up Left
			if MovementAxisValue.y < -DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_UP_LEFT
				GlobalPlayer.IsFlipped = true
				pass
			# Down Left
			elif MovementAxisValue.y > DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_DOWN_LEFT
				GlobalPlayer.IsFlipped = true
				pass
			# Left
			else:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_LEFT
				GlobalPlayer.IsFlipped = true
				pass
			pass

		if abs(MovementAxisValue.x) == 0:
			# Up
			if MovementAxisValue.y < -DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_UP
				GlobalPlayer.IsFlipped = false
				pass
			# Down
			if MovementAxisValue.y > DEAD_ZONE:
				GlobalPlayer.G_CurrentPlayerDirection = GlobalPlayer.E_PlayerDirection.STATE_DOWN
				GlobalPlayer.IsFlipped = false
				pass	
			pass

		pass


	else:
		GlobalPlayer.G_CurrentMoveState = GlobalPlayer.E_PlayerMovementState.STATE_IDLE

	pass
	
