extends Control

@export var text_speed : float = 0.04
@export var player_image : Texture
@export var mentor_image : Texture

var dialog_index = -1
var target_index = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = text_speed
	$"../../Racecar".connect("update_dialog_index", update_dialog)

func handleDialog() -> void:
	while dialog_index < target_index:
		dialog_index += 1
		if dialog_index >= len(dialog):
			return
			
		$".".visible = true
		
		$Name.text = dialog[dialog_index]["Name"]
		$Message.text = dialog[dialog_index]["Text"]

		$Message.visible_characters = 0
		
		$Image.texture = player_image if $Name.text == "Player" else mentor_image
		
		while $Message.visible_characters < len($Message.text):
			$Message.visible_characters += 1
			
			$Timer.start()
			await $Timer.timeout
			
		await get_tree().create_timer(text_speed*100).timeout
		$".".visible = false

func update_dialog(index: int = dialog_index + 1) -> void:
	target_index = index
	handleDialog()

#Example line for easy copy pasting
#			 ,{"Name":"", "Text": ""}
var dialog = [{"Name":"Player", "Text":"Hello There This is a lot of text to see how its handled so I am just going to keep typing until I feel like stopping which I guess is right about now"}
			 ,{"Name":"Mentor", "Text": "This is a test message"}
			 ]
