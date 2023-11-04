extends Node3D

@export var show_dialogue_until : int = -1
@onready var com = get_tree().root.get_node("Level/GUI/Communication")

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body is Player):
		self.queue_free()
		com.update_dialogue(show_dialogue_until)
