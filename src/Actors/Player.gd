extends Actor


func _ready():
	screen_size = get_viewport_rect().size

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			facing_right = true
			animationPlayer.play("player_swim_right")
		elif input_vector.x < 0:
			facing_right = false
			animationPlayer.play("player_swim_left")
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		rotation = velocity.normalized().y * 1.5 if facing_right else -(velocity.normalized().y * 1.5)
		
	else:
		if facing_right:
			animationPlayer.play("player_rest_right")
		elif !facing_right:
			animationPlayer.play("player_rest_left")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	
	
	velocity = move_and_slide(velocity)
	
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
