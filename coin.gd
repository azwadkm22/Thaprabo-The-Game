extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	if "Player" in body.name:	
		emit_signal("coin_collected")
		body.addCoin()
		
	queue_free()
	pass # Replace with function body.
