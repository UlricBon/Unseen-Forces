extends Node

@onready var torch_scene = $"../Torch/TorchScene"
@onready var torch_scene_2 = $"../Torch/TorchScene2"
@onready var torch_scene_3 = $"../Torch/TorchScene3"
var allTorchLit = false

func _process(delta):
	if torch_scene.isLit and torch_scene_2.isLit and torch_scene_3.isLit:
		allTorchLit = true
	
