extends Node2D

signal timeout

const TIME_PERIOD = 0.5
var time = 0


func _ready():

	spawn_ground()
	move_location()

func _process(delta: float) -> void:
	time += delta
	if time > TIME_PERIOD:
		spawn_ground()
		move_location()
		time = 0
		

func spawn_ground():
	var SpawnBlock = preload("res://SpawnBlock.tscn").instance()
	SpawnBlock.position = self.position+Vector2(randi()%40+20, randi()%-30+1)
	print(SpawnBlock.position)
	print(self.position)
	get_tree().get_root().add_child(SpawnBlock)
	

func move_location():
	self.position += Vector2(40, 0)
	
