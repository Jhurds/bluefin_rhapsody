extends Node2D

var eatable_pool = []
onready var player = get_node("Player")
var _original_calories

func _ready():
	_original_calories = player.calories
	$level_cleared/Control.visible = false

func _process(_delta):
	if player.calories >= 2400:
		$level_cleared/Control/score_box/gained_calories.text = str(player.calories - _original_calories)
		$level_cleared/Control.visible = true
		$level_cleared/Control.get_tree().paused = true
		
