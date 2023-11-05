extends Node3D

@export var lightColor : Color
@export var energy : float
@export var negativelight : bool
@export var Sun : DirectionalLight3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body is Player):
		Sun.light_color = lightColor
		Sun.light_energy = energy
		Sun.light_negative = negativelight
		self.queue_free()
