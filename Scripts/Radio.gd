extends StaticBody3D

@export var animationPlayer : AnimationPlayer
@export var radio : AudioStreamPlayer3D
@export var altRadio : AudioStreamPlayer3D
var currentlyAlternating : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	altRadio.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _change_music(music:String):
	if (currentlyAlternating):
		radio.volume_db = -80
		radio.stream = load("res://Audio/Music/"+music+".mp3")
		radio.play(altRadio.get_playback_position())
		animationPlayer.play("ToRadio")
	else:
		altRadio.volume_db = -80
		altRadio.stream = load("res://Audio/Music/"+music+".mp3")
		altRadio.play(radio.get_playback_position())
		animationPlayer.play("ToAlt")
	currentlyAlternating = !currentlyAlternating
