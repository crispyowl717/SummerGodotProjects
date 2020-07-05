extends KinematicBody2D

# Horizontal Movement
const ACCELERATION = 512
var MAX_SPEED = 80
const FRICTION = 0.25
const HORIZONTAL_DAMPING = 0.1

# Vertical Movement 
const AIR_RESISTANCE = 0.07
const GRAVITY = 375
const JUMP_FORCE = 160

# Movement Optimization 
const JUMP_COOLDOWN_TIME = 0.15
const JUMP_GRACE_PERIOD_TIME = 0.1

var GroundedTimer = 0
var JumpTimer = 0
var Motion = Vector2.ZERO

# Editor Nodes
onready var _Sprite = $Sprite
onready var _AnimationPlayer = $AnimationPlayer
onready var _JumpAudio = $JumpAudio

const TIME_PERIOD = 5 
var time = 0

func _physics_process(delta):

	var horizontalMovement = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	time += delta
	if time > TIME_PERIOD:
		MAX_SPEED *= 1.15
		time = 0

	if abs(horizontalMovement) > 0.05:
		Motion.x += horizontalMovement * ACCELERATION * delta
		Motion.x *= pow(1 - HORIZONTAL_DAMPING, delta * 10)
		Motion.x = clamp(Motion.x, -MAX_SPEED, MAX_SPEED)
		_Sprite.flip_h = horizontalMovement < 0
	else:
		Motion.x = lerp(Motion.x, 0, FRICTION)
		Motion.y = lerp(Motion.y, 0, AIR_RESISTANCE)

	JumpTimer -= delta
	GroundedTimer -= delta

	if Input.is_action_just_pressed("ui_up"):
		JumpTimer = JUMP_COOLDOWN_TIME
	if is_on_floor():
		GroundedTimer = JUMP_GRACE_PERIOD_TIME	
		_JumpAudio.stop()

	if JumpTimer > 0 and GroundedTimer > 0:
		_JumpAudio.play()
		JumpTimer = 0
		GroundedTimer = 0
		Motion.y = -JUMP_FORCE

	if Input.is_action_just_released("ui_up") and GroundedTimer > 0 and Motion.y < -JUMP_FORCE/2:
		_JumpAudio.play()
		JumpTimer = 0
		GroundedTimer = 0
		Motion.y = -JUMP_FORCE/2


	if abs(horizontalMovement) > 0.05 and is_on_floor():
		_AnimationPlayer.play("Run")
	else:
		_AnimationPlayer.play("Idle")


	if Input.is_action_just_pressed("ui_end"):
		get_tree().quit()

	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

	Motion.y += GRAVITY * delta
	Motion = move_and_slide(Motion, Vector2.UP)
