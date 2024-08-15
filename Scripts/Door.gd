extends Area2D

@onready var torch_scene_2 = $"../TorchScene2"
@onready var torch_scene = $"../TorchScene"
@onready var collision_shape_2d = $CollisionShape2D

func _process(delta):
	if torch_scene.isLit and torch_scene_2.isLit:
		self.visible = true
		collision_shape_2d.disabled = false

func _on_body_entered(body):
	print("you win!")
