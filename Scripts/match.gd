extends Area2D
#@onready var animation_player = $AnimationPlayer
func _on_body_entered(body):
	if body is CharacterBody2D:
		var pbar = body.get_node("FuelBar")
		pbar.value = pbar.max_value
	queue_free()
	#animation_player.play("new_animation")
