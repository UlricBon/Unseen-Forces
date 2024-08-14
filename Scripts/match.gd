extends Area2D

@onready var game_manager = %GameManager
#@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	game_manager.add_point()
	queue_free()
	#animation_player.play("new_animation")
