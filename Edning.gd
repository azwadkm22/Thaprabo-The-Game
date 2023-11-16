extends Control

var state = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	state = $Next.state
	pass # Replace with function body.

func _process(delta):
	state = $Next.state
	
	if state == 0:
		$AnimationPlayer.play("Idle")
		$Narration.text = "The Genie Comes to visit her"
		$SGenie.visible = true
		$Genie.visible = false
		$Nashmin.visible = false
		
			
	if state == 1:
		$Narration.text = "He asks her a question"
		$Nashmin/dialogue.text = ""
		$Genie/dialogue.text = "Did you have your fill?"
		$Nashmin.visible = false
		$SGenie.visible = true;
		$Genie.visible = true;
		
			
			
	if state == 2:
		$Narration.text = "..."
		$Nashmin/dialogue.text = ""
		$Genie/dialogue.text = "Shobaike thapraye valo lagtese?"
		$Nashmin.visible = false
		$SGenie.visible = true;
		$Genie.visible = true;
		
	if state == 3:
		$Narration.text = "..."
		$Nashmin/dialogue.text = "You know what?"
		$Genie/dialogue.text = ""
		$Nashmin.visible = true
		$SGenie.visible = true;
		$Genie.visible = false;
			
	if state == 4:
		$Narration.text = "Even after all that violence..."
		$Nashmin/dialogue.text = "Not really"
		$Genie/dialogue.text = "Whaaaaaaaaaaaaaatttttt????"
		$Nashmin.visible = true
		$SGenie.visible = true;
		$Genie.visible = true;
		
			
	if state == 5:
		$Narration.text = "Her thirst for thaprano is not quenched"
		$Nashmin/dialogue.text = ""
		$Genie/dialogue.text = "Why??"
		$Nashmin.visible = false
		$SGenie.visible = true;
		$Genie.visible = true;
			
	if state == 6:
		$Narration.text = "..."
		$Nashmin/dialogue.text = "Akjon ke thaprano akhono baki ase"
		$Genie/dialogue.text = "And that would be??"
		$Nashmin.visible = true
		$SGenie.visible = true;
		$Genie.visible = true;
		
	if state == 7:
		$Narration.text = "..."
		$Nashmin/dialogue.text = "Hehe"
		$Genie/dialogue.text = "Ohnou *chuckles*"
		$Nashmin.visible = true
		$SGenie.visible = true;
		$Genie.visible = true;
		$AnimationPlayer.play("CreepySmile")
		
	if state == 8:
		$Genie.visible = false
		$Nashmin.visible = false
		$Narration.text = "Thanks for playing the game."
		
	if state == 9:
		$Narration.text = "Hope you enjoyed it :D"
		
	if state == 10:
		
		$Narration.text = "You can stop pressing the button now....."
		
	if state == 11:
		$Narration.text = "For real...."
		
	if state == 12:
		$Narration.text = "Stahhhhppppp"
		
	if state == 13:
		$Narration.text = "Part two next year geez -.-"
		
	if state == 14:
		$Narration.text = "For now I'm returning to the title. Byebye."
		
	if state > 14:
		get_tree().change_scene("res://Levels/Title.tscn")
	
	
		
