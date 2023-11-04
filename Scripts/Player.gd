extends VehicleBody3D

signal update_dialog_index(index)

@export var MAX_STEER: float = 0.4
@export var ENGINE_POWER: int = 200

# Called every frame. 'delta' is the elapsed time since the previous frwwwwwwwwame.
func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * MAX_STEER * 0.4, 5 * delta)
	engine_force = Input.get_axis("back", "forward") * ENGINE_POWER
