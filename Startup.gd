extends Control

var state = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	state = $Next.state
	pass # Replace with function body.

func _process(delta):
	state = $Next.state
	
	if state == 0:
		$Narration.text = "Today's your birthday, you sense nothing special."
		$SGenie.visible = false;
		$Genie.visible = false;
		
			
	if state == 1:
		$Narration.text = "People wishing you from 12 AM."
		$Nashmin/dialogue.text = "Geez, I hate talking to people, ato wish keno kora lagbe"
		$Genie/dialogue.text = ""
		$SGenie.visible = false;
		$Genie.visible = false;
		
			
			
	if state == 2:
		$Narration.text = "Suddenly a light enters the room"
		$Nashmin/dialogue.text = "What is that????"
		$Genie/dialogue.text = ""
		$SGenie.visible = false;
		$Genie.visible = false;
		
			
			
	if state == 3:
		$Narration.text = "You see a genie."
		$Nashmin/dialogue.text = "HOW TF DID YOU GET HERE"
		$Genie/dialogue.text = ""
		$SGenie.visible = true;
		$Genie.visible = false;
		
			
	if state == 4:
		$Narration.text = "..."
		$Nashmin/dialogue.text = "..."
		$Genie/dialogue.text = "Happy Birthday dear, I am the genie locked in people's traditional birthday celebrations."
		$SGenie.visible = true;
		$Genie.visible = true;
			
	if state == 5:
		$Narration.text = "..."
		$Nashmin/dialogue.text = "To akhon ami ki korbo -____-"
		$Genie/dialogue.text = "You, you have freed me by not feeling anything special for your Birthday."
		$SGenie.visible = true;
		$Genie.visible = true;
		
	if state == 6:
		$Narration.text = "What will Nashmin do?"
		$Nashmin/dialogue.text = "I don't want anything from anyone."
		$Genie/dialogue.text = "And for that reason I shall grant you one wish, not three because I'm not a stereotype."
		$SGenie.visible = true;
		$Genie.visible = true;
	
	if state == 7:
		$Narration.text = "I don't want anything from anyone "
		$Nashmin/dialogue.text = ""
		$Nashmin.visible = false
		$Genie/dialogue.text = " What would you like to choose Nashmin Nawar?"
		$SGenie.visible = true;
		$Genie.visible = true;
		
	if state == 8:
		$Narration.text = "She thinks for a while and says..."
		$Nashmin/dialogue.text = "Amar shobaike thapraite mon chaitese"
		$Nashmin.visible = true
		$Genie/dialogue.text = ""
		$SGenie.visible = true;
		$Genie.visible = false;
		
	if state == 9:
		get_tree().change_scene("res://Levels/Tutorial.tscn")
		
