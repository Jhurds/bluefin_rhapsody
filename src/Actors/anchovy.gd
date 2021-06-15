extends actor

var starting_position 

func _ready():
	velocity.x = -MAX_SPEED
	starting_position = position
	scale.x *= -1.0

func _physics_process(delta) -> void:
	if position.x <= (starting_position.x - 300) or position.x >= (starting_position.x + 300):
		velocity.x *= -1.0
		scale.x *= -1.0
	velocity.y = move_and_slide(velocity).y
