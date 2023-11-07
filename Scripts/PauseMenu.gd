extends Control

func _pause_toggle():
	get_tree().paused = !get_tree().paused
	if (get_tree().paused):
		show()
	else:
		hide()

func _input(event):
	if event is InputEventKey:
		if (event.is_action_pressed("ui_cancel")):
			_pause_toggle()
