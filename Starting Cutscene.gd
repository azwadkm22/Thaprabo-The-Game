extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $PlayerNV.position.x < $Movement.position.x + 100:
			$Genie.position.x = $Movement.position.x + 50
			
	if $PlayerNV.position.x > $Movement.position.x + 100 && $PlayerNV.position.x < $Jump.position.x+ 100:
			$Genie.position.x = $Jump.position.x + 50
			
			
	if $PlayerNV.position.x > $Jump.position.x + 100 && $PlayerNV.position.x < $Dash.position.x+ 100:
			$Genie.position.x = $Dash.position.x + 50
	
	if $PlayerNV.position.x > $Dash.position.x + 100 && $PlayerNV.position.x < $DashJK.position.x+ 100:
			$Genie.position.x = $DashJK.position.x + 50
	
	if $PlayerNV.position.x > $DashJK.position.x + 100 && $PlayerNV.position.x < $Others.position.x+ 100:
			$Genie.position.x = $Others.position.x + 50
			
	if $PlayerNV.position.x > $Others.position.x + 100 && $PlayerNV.position.x < $Slap.position.x+ 100:
			$Genie.position.x = $Slap.position.x + 50
			
	if $PlayerNV.position.x > $Slap.position.x + 100 && $PlayerNV.position.x < $TutorialDone.position.x+ 100:
			$Genie.position.x = $TutorialDone.position.x + 50
	
	if $Enemy:
		$Gravestone.visible	= false
		$gravewriting.visible = false
	else:
		$Gravestone.visible	= true
		$gravewriting.visible = true
