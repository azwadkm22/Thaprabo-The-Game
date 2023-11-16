extends Area2D


func _on_Node2D_body_entered(body):
	body.get_enraged()
	queue_free()
	pass # Replace with function body.
