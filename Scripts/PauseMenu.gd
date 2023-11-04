extends Control

func _pause_toggle():
	get_tree().paused = !get_tree().paused
	if (get_tree().paused):
		show()
	else:
		hide()


