extends Area2D

#@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	queue_free()
	#animation_player.play("new_animation")
