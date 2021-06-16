extends Node2D

var eatable_pool = []
onready var player = get_node("player")

func _process(_delta):
	print(player.eaten)
	
	if player.calories >= 2400:
		$level_cleared/Control/score_box/Label.text = str(player.calories)
		$level_cleared/Control.visible = true
		$level_cleared/Control.get_tree().paused = true
