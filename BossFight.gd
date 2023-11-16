extends Node2D

func _process(delta):
	if $Genie != null:
		if $Genie.position.x > $Player.position.x:
			$Genie.facingLeft = false
		else:
			$Genie.facingLeft = true
