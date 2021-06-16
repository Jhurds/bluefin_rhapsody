extends Node2D

onready var player = get_node("Player")


func _ready():
	$level_cleared/Control.visible = false

func _process(_delta):
	if player.calories >= 2400:
		var calories_gained = 0
		for food in player.eaten:
			calories_gained += food.calories
		$level_cleared/Control/score_box/gained_calories.text = str(calories_gained)
		$level_cleared/Control.visible = true
		$level_cleared/Control.get_tree().paused = true
		
