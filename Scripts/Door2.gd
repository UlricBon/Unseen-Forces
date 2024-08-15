extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var game_manager_level_2 = $"../GameManagerLevel2"

func _process(delta):
	if game_manager_level_2.allTorchLit:
		self.visible = true
		collision_shape_2d.disabled = false

func _on_body_entered(body):
	print("you win!")
