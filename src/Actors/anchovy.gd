extends Actor
class_name Anchovy

var starting_position
export var patrol_range = 1

func _ready():
	_velocity.x = -MAX_SPEED
	starting_position = position
	scale.x *= -1.0
	patrol_range = randi() % patrol_range + 100
	
func _on_eatDetector_body_entered(body):
	queue_free()

func _physics_process(_delta) -> void:
	if position.x <= (starting_position.x - patrol_range) or position.x >= (starting_position.x + patrol_range):
		_velocity.x *= -1.0
		scale.x *= -1.0
	_velocity.y = move_and_slide(_velocity).y



