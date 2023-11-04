class_name Communication

extends Control

@export var text_speed : float = 0.04
@export var player_image : Texture
@export var mentor_image : Texture

var dialogue_index = -1
var target_index = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = text_speed

func handleDialog() -> void:
	while dialogue_index < target_index:
		dialogue_index += 1
		if dialogue_index >= len(dialogue):
			return
			
		$".".visible = true
		
		$Name.text = dialogue[dialogue_index]["Name"]
		$Message.text = dialogue[dialogue_index]["Text"]

		$Message.visible_characters = 0
		$AudioStreamPlayer.stream = load("res://Audio/Dialogue/" + dialogue_audio[dialogue_index] +".ogg")
		$AudioStreamPlayer.play()
		
		$Image.texture = player_image if $Name.text == "Player" else mentor_image
		while $Message.visible_characters < len($Message.text):
			$Message.visible_characters += 1
			
			$Timer.start()
			await $Timer.timeout
			
		await $AudioStreamPlayer.finished
		await get_tree().create_timer(0.5).timeout
		$".".visible = false

func update_dialogue(index: int = target_index + 1) -> void:
	target_index = index
	if (!$".".visible):
		handleDialog()

#Example line for easy copy pasting
#			 ,{"Name":"", "Text": ""}
var dialogue = [{"Name":"Player", "Text":"Hello There This is a lot of text to see how its handled so I am just going to keep typing until I feel like stopping which I guess is right about now"}
			 ,{"Name":"Mentor", "Text": "This is a test message"}
			 ]
			
var dialogue_audio = ["playerVoiceTest","playerVoiceTest"]
