extends Node2D

var eatable_pool = []
onready var player = get_node("Player")

func _ready():
	if player.calories >= 2400:
		$level_cleared/Control._goalReached()

func _process(_delta):
	print(player.eaten)
	

