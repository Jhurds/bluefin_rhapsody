extends actor
class_name anchovy

var starting_position
export var CALORIES: = 100

func _ready():
	_velocity.x = -MAX_SPEED
	starting_position = position
	scale.x *= -1.0
	
func _on_eatDetector_body_entered(body):
	queue_free()

func _physics_process(_delta) -> void:
	if position.x <= (starting_position.x - 300) or position.x >= (starting_position.x + 300):
		_velocity.x *= -1.0
		scale.x *= -1.0
	_velocity.y = move_and_slide(_velocity).y



