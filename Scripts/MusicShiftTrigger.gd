extends Node3D

@export var music : String = "violins"

func _on_area_3d_body_entered(body: Node3D) -> void:
	print_debug("WHAT")
	if (body.is_in_group("Radio")):
		print_debug("NOT WORKING")
		self.queue_free()
		body._change_music(music)


func _on_area_3d_area_entered(area):
	print_debug("WHAT")
	if (area.is_in_group("Radio")):
		print_debug("NOT WORKING")
		self.queue_free()
		area._change_music(music)
