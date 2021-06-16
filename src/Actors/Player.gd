extends Actor
class_name Player

var eaten = []

onready var animationPlayer = $AnimationPlayer

func _ready():
	screen_size = get_viewport_rect().size
	
func _on_eatDetector_body_entered(body):
	eaten.append(body.duplicate())
	

func _physics_process(delta):
	var input_vector = get_input_vector_normalized()

	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			facing_right = true
			animationPlayer.play("player_swim_right")
		elif input_vector.x < 0:
			facing_right = false
			animationPlayer.play("player_swim_left")
		
		_velocity = _velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		rotation = _velocity.normalized().y * 1.5 if facing_right else -(_velocity.normalized().y * 1.5)
		
	else:
		if facing_right:
			animationPlayer.play("player_rest_right")
		elif !facing_right:
			animationPlayer.play("player_rest_left")
		_velocity = _velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	_velocity = move_and_slide(_velocity)


func get_input_vector_normalized() -> Vector2:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()

func _digest_eaten(eaten: Array) -> void:
	for food in eaten:
		calories += food.CALORIES
		eaten.pop_front()

