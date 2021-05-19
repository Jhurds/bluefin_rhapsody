extends Position2D

onready var parent = $".."

func _ready():
	update_camera_offeset()
	
func _physics_process(delta):
	update_camera_offeset()

func update_camera_offeset():
	rotation = 0 if parent.facing_right else 180
