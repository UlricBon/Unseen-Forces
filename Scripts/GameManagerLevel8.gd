extends Node

@onready var torch_scene = $"../Torch/TorchScene"

var allTorchLit = false

func _process(delta):
	if torch_scene.isLit:
		allTorchLit = true
