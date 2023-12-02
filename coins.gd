extends Area2D




func _on_body_entered(body):
	Global.Coins += 1
	$AnimatedSprite2D.visible = false


func _on_body_exited(body):
	pass
