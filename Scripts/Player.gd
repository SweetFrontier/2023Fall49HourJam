class_name Player
extends VehicleBody3D

@export var MAX_STEER: float = 0.4
@export var ENGINE_POWER: int = 200
@export var MAX_SPEED: float = 40
#audio stuff
@export var musicPlayer : AnimationPlayer
@export var radio : AudioStreamPlayer3D
@export var altRadio : AudioStreamPlayer3D
@export var noise : AudioStreamPlayer3D
var currentlyAlternating : bool = false
var perceptualEnginePower: int = 200

func _ready():
	perceptualEnginePower = ENGINE_POWER

# Called every frame. 'delta' is the elapsed time since the previous frwwwwwwwwame.
func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right", "left") * MAX_STEER * 0.4, 5 * delta)
	engine_force = Input.get_axis("back", "forward") * perceptualEnginePower
	quaternion.z = lerp(quaternion.z, 0.0, delta * 5)
	quaternion.x = lerp(quaternion.x, 0.0, delta * 5)
	if (linear_velocity.length() > MAX_SPEED):
		engine_force = -100
	if (Input.is_action_just_pressed("boost")):
		perceptualEnginePower = ENGINE_POWER*1.2
	elif (Input.is_action_just_released("boost")):
		perceptualEnginePower = ENGINE_POWER


func _change_music(music:String):
	if (music == "fade"):
		radio.stop()
		altRadio.stop()
	elif (currentlyAlternating):
		radio.volume_db = -80
		radio.stream = load("res://Audio/Music/"+music+".ogg")
		radio.play(altRadio.get_playback_position())
		musicPlayer.play("ToRadio")
	else:
		altRadio.volume_db = -80
		altRadio.stream = load("res://Audio/Music/"+music+".ogg")
		altRadio.play(radio.get_playback_position())
		musicPlayer.play("ToAlt")
	currentlyAlternating = !currentlyAlternating
