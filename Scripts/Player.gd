class_name Player

extends VehicleBody3D

@export var MAX_STEER: float = 0.4
@export var ENGINE_POWER: int = 200

#audio stuff
@export var musicPlayer : AnimationPlayer
@export var radio : AudioStreamPlayer3D
@export var altRadio : AudioStreamPlayer3D
var currentlyAlternating : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frwwwwwwwwame.
func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * MAX_STEER * 0.4, 5 * delta)
	engine_force = Input.get_axis("back", "forward") * ENGINE_POWER
	quaternion.z = lerp(quaternion.z, 0.0, delta * 5)
	quaternion.x = lerp(quaternion.x, 0.0, delta * 5)


func _change_music(music:String):
	if (currentlyAlternating):
		radio.volume_db = -80
		radio.stream = load("res://Audio/Music/"+music+".mp3")
		radio.play(altRadio.get_playback_position())
		musicPlayer.play("ToRadio")
	else:
		altRadio.volume_db = -80
		altRadio.stream = load("res://Audio/Music/"+music+".mp3")
		altRadio.play(radio.get_playback_position())
		musicPlayer.play("ToAlt")
	currentlyAlternating = !currentlyAlternating
