extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pause_toggle():
	get_tree().paused = !get_tree().paused
	if (get_tree().paused):
		show()
	else:
		hide()


