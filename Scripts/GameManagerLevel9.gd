extends Node

@onready var torch_scene = $"../Torch/TorchScene"
@onready var torch_scene_2 = $"../Torch/TorchScene2"
@onready var torch_scene_3 = $"../Torch/TorchScene3"
@onready var torch_scene_4 = $"../Torch/TorchScene4"
@onready var torch_scene_5 = $"../Torch/TorchScene5"
@onready var torch_scene_6 = $"../Torch/TorchScene6"

var allTorchLit = false

func _process(delta):
	if torch_scene.isLit and torch_scene_2.isLit and torch_scene_3.isLit and torch_scene_4.isLit and torch_scene_5.isLit and torch_scene_6.isLit:
		allTorchLit = true
