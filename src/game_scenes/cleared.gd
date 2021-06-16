extends Control

onready var player = get_node("Player")

func _goalReached():
	visible = true
	get_tree().paused = true
	

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/home_menu_screen.tscn")

