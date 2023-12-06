extends MeshInstance3D

@export var max = 3
@export var speed = 5

var initial_pos
@export var moveback: bool = get_start()

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_pos = position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# check if it exceeds the max
	if position.x > (initial_pos+max):
		moveback = false
		
	if position.x < (initial_pos-max):
		moveback = true
		
	if moveback:
		move_back(delta)
	else:
		move_forward(delta)

func get_start():
	var value = randi() % 2
	if (value==1):
		return true
	else:
		return false

func move_back(delta):
	position.x += speed*delta

func move_forward(delta):
	position.x -= speed*delta
