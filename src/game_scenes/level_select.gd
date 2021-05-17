extends Control

export (PackedScene) var base_button
export (int) var total_levels = 0
export (NodePath) var grid

func _ready():
	grid = get_node(grid)
	
	if total_levels > 4:
		column_size()
		
	for i in range(0, total_levels):
		generate_buttons(i + 1)

func generate_buttons(name : int):
	var base = base_button.instance()
	base.set_name(str(name))
	base.set_text(str(name))
	base.level_path = ("res://src/levels/level_" + str(name) + ".tscn")
	grid.add_child(base)
	
func column_size():
	if total_levels % 2 == 0:
		grid.columns = total_levels / 2
	else:
		grid.columns = total_levels / 2 + 1

func _on_Back_Button_pressed():
		get_tree().change_scene("res://src/home_menu_screen.tscn")
