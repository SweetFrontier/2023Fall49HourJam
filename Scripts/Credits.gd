extends Node3D

@export var transitionPlayer : AnimationPlayer
@export var musicSound : AnimationPlayer
@export var buttonSound : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start_button_pressed():
	get_tree().quit()
