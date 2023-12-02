extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Global.live -= 1
		Global.SPEED = 900
		get_tree().reload_current_scene()
		if Global.live == 0:
			Global.live = 3
			Global.SPEED = 900
			get_tree().change_scene_to_file("res://test.tscn")
	
