extends Node2D

var eatable_pool = []
onready var player = get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	print(player.eaten)
