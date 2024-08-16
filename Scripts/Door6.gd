extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var game_manager_level_6 = $"../GameManagerLevel6"
@onready var open = $Open
@onready var close = $Close
@onready var sprite_2d = $Sprite2D
var canEnter = false

func _process(delta):
	if game_manager_level_6.allTorchLit:
		open.visible = true
		close.visible = false
		sprite_2d.visible = true
		collision_shape_2d.disabled = false
	if Input.is_action_just_pressed("Enter") and canEnter:
		print("you have entered")
		call_deferred("_change_scene")

func _on_body_entered(body):
	print("you are in")
	canEnter = true
		
func _on_body_exited(body):
	print("you are out")
	canEnter = false

func _change_scene():
	get_tree().change_scene_to_file("res://Scene/level10.tscn")
