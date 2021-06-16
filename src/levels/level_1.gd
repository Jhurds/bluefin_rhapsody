extends Node2D

var food_pool = []
onready var player = get_node("Player")

func _on_foodDetector_body_entered(body):
	food_pool.append(body)

func _on_foodDetector_body_exited(body):
	food_pool.erase(body)

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
	

