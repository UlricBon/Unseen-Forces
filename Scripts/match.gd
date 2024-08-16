extends Area2D
#@onready var animation_player = $AnimationPlayer
@onready var pbar = get_parent().get_node("FuelBar").get_node("TextureProgressBar")
func _on_body_entered(body):
	pbar.value = 350
	queue_free()
	#animation_player.play("new_animation")
