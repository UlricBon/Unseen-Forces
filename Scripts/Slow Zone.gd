extends Area2D


func _on_body_entered(body):
	if body is CharacterBody2D:
		print("You are slowed!")
		body.slow_timer.start()
		body.playerSlow = true
		
