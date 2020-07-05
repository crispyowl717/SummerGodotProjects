extends AnimationPlayer


onready var PlayerSprite = $"../Sprite3D"

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:

	PlayerSprite.set_flip_h(GlobalPlayer.IsFlipped) 

	match GlobalPlayer.G_CurrentMoveState:
		GlobalPlayer.E_PlayerMovementState.STATE_IDLE:
			_IdleAnimation()
		GlobalPlayer.E_PlayerMovementState.STATE_WALIKING:
			_WalkingAnimation()
	pass

func _WalkingAnimation():
	match GlobalPlayer.G_CurrentPlayerDirection:
		GlobalPlayer.E_PlayerDirection.STATE_DOWN:
			PlayerSprite.translation = Vector3(0.524, 0, 0)
			play("STATE_DOWN_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_DOWN_LEFT:
			PlayerSprite.translation = Vector3(-0.322, 0, 0)
			play("STATE_DOWN_RIGHT_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_DOWN_RIGHT:
			PlayerSprite.translation = Vector3(0.524, 0, 0)
			play("STATE_DOWN_RIGHT_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_LEFT:
			PlayerSprite.translation = Vector3(-0.199, 0, 0)
			play("STATE_RIGHT_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_RIGHT:
			PlayerSprite.translation = Vector3(0.199, 0, 0)
			play("STATE_RIGHT_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_UP:
			PlayerSprite.translation = Vector3(0.675, 0, 0)
			play("STATE_UP_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_UP_LEFT:
			PlayerSprite.translation = Vector3(-0.322, 0, 0)			
			play("STATE_UP_RIGHT_WALK")
		GlobalPlayer.E_PlayerDirection.STATE_UP_RIGHT:
			PlayerSprite.translation = Vector3(0.324, 0, 0)
			play("STATE_UP_RIGHT_WALK")
	pass

func _IdleAnimation():
	match GlobalPlayer.G_CurrentPlayerDirection:
		GlobalPlayer.E_PlayerDirection.STATE_DOWN:
			PlayerSprite.translation = Vector3(0.524, 0, 0)
			play("STATE_DOWN_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_DOWN_LEFT:
			PlayerSprite.translation = Vector3(-0.322, 0, 0)			
			play("STATE_DOWN_RIGHT_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_DOWN_RIGHT:
			PlayerSprite.translation = Vector3(0.524, 0, 0)
			play("STATE_DOWN_RIGHT_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_LEFT:
			PlayerSprite.translation = Vector3(-0.199, 0, 0)
			play("STATE_RIGHT_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_RIGHT:
			PlayerSprite.translation = Vector3(0.199, 0, 0)
			play("STATE_RIGHT_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_UP:
			PlayerSprite.translation = Vector3(0.675, 0, 0)
			play("STATE_UP_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_UP_LEFT:
			PlayerSprite.translation = Vector3(-0.322, 0, 0)			
			play("STATE_UP_RIGHT_IDLE")
		GlobalPlayer.E_PlayerDirection.STATE_UP_RIGHT:
			PlayerSprite.translation = Vector3(0.324, 0, 0)
			play("STATE_UP_RIGHT_IDLE")
	pass
