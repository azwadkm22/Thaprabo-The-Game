extends Area2D

func _ready():
	pass # Replace with function body.


func _on_Food_body_entered(body):
	if 'Player' in body.name:
		body.health += 20
	queue_free()
	pass # Replace with function body.
