extends Control

@export var videoPlayer : VideoStreamPlayer
@export var transitionToBlack : AnimationPlayer
@export var buttonSound : AudioStreamPlayer
@export var SkipButton : AnimationPlayer
@export var howLongSkipButtonVisible : float = 1.2

var skipTimer : float = 0;
var skipVisible : bool = false
var skipping : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	videoPlayer.play()
	await videoPlayer.finished
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _process(delta):
	if (skipTimer > 0):
		skipTimer -= delta
		if (skipTimer <= 0):
			skipTimer = 0
			SkipButton.play("disappear")
			skipVisible = false

func _input(event : InputEvent):
	if (event is InputEventKey and event.keycode == KEY_ESCAPE) or (event is InputEventMouseButton and event.is_double_click()):
		if (!skipping):
			skipping = true
			transitionToBlack.play("fadeOut")
			buttonSound.play()
			await transitionToBlack.animation_finished
			get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	elif (event is InputEventMouseMotion):
		#play animation only if not already visible
		if (!skipVisible):
			SkipButton.play("appear")
		#set timer for skip to disappear for howLongSkipButtonVisible seconds
		skipTimer = howLongSkipButtonVisible
		skipVisible = true
