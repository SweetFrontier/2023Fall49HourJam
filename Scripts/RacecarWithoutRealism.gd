#class_name Player
extends CharacterBody3D


@export var MAX_STEER: float = 0.4
@export var ENGINE_POWER: int = 200
@export var MAX_SPEED: float = 40
#audio stuff
@export var musicPlayer : AnimationPlayer
@export var radio : AudioStreamPlayer3D
@export var altRadio : AudioStreamPlayer3D
@export var noise : AudioStreamPlayer3D
var currentlyAlternating : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if (Input.is_action_pressed("ui_up")):
		velocity += transform.basis * Vector3(0,0,MAX_SPEED)

	move_and_slide()



func _change_music(music:String):
	if (music == "fade"):
		radio.stop()
		altRadio.stop()
		noise.stop()
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
