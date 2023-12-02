extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		Global.SPEED += 50
		#get_tree().reload_current_scene()
