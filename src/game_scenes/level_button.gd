extends TextureButton


var level_path : String

func _ready():
	set_Label()
	
func set_Label():
	$Label.text = name
	
func _on_Button_pressed():
	get_tree().change_scene(level_path)


func _on_TextureButton_pressed():
	get_tree().change_scene(level_path)
