extends Control

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		visible = true
		get_tree().paused = true
		
func _on_continue_pressed():
	hide()
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()


func _on_mainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/home_menu_screen.tscn")
