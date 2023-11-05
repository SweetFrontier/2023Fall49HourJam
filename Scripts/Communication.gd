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
var dialogue = [{"Name":"Player", "Text":"[i]It’s a big day. Graduation is just around the corner. [/i]"}
			   ,{"Name":"Player", "Text": "[i]I’ve been training for ages now, and now it’s all coming to an end.[/i]"}
			   ,{"Name":"Player", "Text": "[i]All I have to do is drive one last lap.[/i]"}
			   ,{"Name":"Player", "Text": "[i]My hands are shaking. I can’t afford to be this nervous.[/i]"}
			   ,{"Name":"Player", "Text": "It’s only one more lap."}
			   ,{"Name":"Player", "Text": "Off I go."}
			
			   ,{"Name":"Player", "Text": "Why does it seem like the track is...                     ...longers"}
			   ,{"Name":"Player", "Text": "Can I even... do this?"}
			   ,{"Name":"Player", "Text": "No! I-I… I have to..."}
			   ,{"Name":"Player", "Text": "Everyone is expecting me to do this"}
			   ,{"Name":"Player", "Text": "They spent so much money...so much of their time..."}
				,{"Name":"Player", "Text": "I need to... I need to..."}
				,{"Name":"Player", "Text": "If I don’t then what was the-"}
				,{"Name":"Mentor", "Text": "Hey, kid"}
				,{"Name":"Mentor", "Text": "Calm down, it’s alright."}
				,{"Name":"Player", "Text": "How-"}
				,{"Name":"Mentor", "Text": "You’re stuck in your own head, kid"}
				,{"Name":"Mentor", "Text": "Take a deep breath"}
				,{"Name":"Mentor", "Text": "It’s only one lap"}   
				,{"Name":"Player", "Text": "I know! It should be easy, then!"}
				,{"Name":"Mentor", "Text": "I never said it was"}
				,{"Name":"Player", "Text": "You’re just telling me what I want to hear"}
				,{"Name":"Mentor", "Text": "Maybe"}
				,{"Name":"Mentor", "Text": "But why can’t you listen to it"}
				,{"Name":"Player", "Text": "..."}
				,{"Name":"Mentor", "Text": "Are you afraid of what you want-"}
				,{"Name":"Player", "Text": "Okay, yeah, sure..just let me focus"}
				,{"Name":"Mentor", "Text": "Sure, kid.."}
				,{"Name":"Mentor", "Text": "Whatever you want."}
				#Snow section
				,{"Name":"Mentor", "Text": "You’ve learned from last time right"}
				,{"Name":"Player", "Text": "I don’t know, have I?"}
				,{"Name":"Mentor", "Text": "I don’t know, have you?"}
				,{"Name":"Mentor", "Text": "You didn’t get cold feet this time, kid"}
				,{"Name":"Mentor", "Text": "Here you are, driving"}
				
				,{"Name":"Mentor", "Text": "Alright, challenge area now, kid"}
				,{"Name":"Player", "Text": "Huh, what? Since when?"}
				,{"Name":"Mentor", "Text": "Since now"}
				,{"Name":"Player", "Text": "[i]Don’t worry, just rely on my[/i]"}
				,{"Name":"Player", "Text": "Not a single one of your instructions was right!"}
				,{"Name":"Mentor", "Text": "Yeah, but you still did it, right?"}
				,{"Name":"Mentor", "Text": "Did you really need me here, or did you want me to be here?"}
				,{"Name":"Player", "Text": "...hm"}
				#right before the tunnel
				,{"Name":"Player", "Text": "Okay, almost at the end"}
				,{"Name":"Player", "Text": "Yeah, just a bit more"}
				,{"Name":"Mentor", "Text": "Yeah..."}
				,{"Name":"Mentor", "Text": "You've got this, kid"}
				,{"Name":"Player", "Text": "Huh?"}
				,{"Name":"Mentor", "Text": "I’m letting go now, kid"}
				,{"Name":"Player", "Text": "What?! Wait-"}
				,{"Name":"Player", "Text": "[b]Wait! No! COme back[/b]"}
				,{"Name":"Player", "Text": "I can’t do this alone!"}
				,{"Name":"Player", "Text": "I can't"}
				,{"Name":"Player", "Text": "I..."}
				,{"Name":"Player", "Text": "I..."}
				,{"Name":"Mentor", "Text": "Welcome back!"}
				,{"Name":"Player", "Text": "...I did it"}
				,{"Name":"Mentor", "Text": "Ofcourse you did. You got what it takes kid"}
				,{"Name":"Player", "Text":"Hm.."}
				,{"Name":"Player", "Text":"Was the track always this short?"}
				,{"Name":"Mentor", "Text":"Its a just matter of prespective"}
				,{"Name":"Mentor", "Text":"But that's behind you focus on what's ahead"}
				,{"Name":"Player", "Text":"The Finish Line!"}
				,{"Name":"Mentor", "Text":"Congratulation kid you are now officially a professional"}
			]
			
var dialogue_audio = ["playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest",
				"playerVoiceTest"]
