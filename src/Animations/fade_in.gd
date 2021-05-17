extends ColorRect

signal fade_finished

func fade_in():
	$AnimationPlayer.play("fade_in_animation")


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("fade_finished")
