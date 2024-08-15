extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var game_manager_level_5 = $"../GameManagerLevel5"

func _process(delta):
	if game_manager_level_5.allTorchLit:
		self.visible = true
		collision_shape_2d.disabled = false

func _on_body_entered(body):
	print("you win!")
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://Scene/level6.tscn")
