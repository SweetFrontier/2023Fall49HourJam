extends Node3D

@export var music : String = "violins"

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body is Player):
		self.queue_free()
		body._change_music(music)
