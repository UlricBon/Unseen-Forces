extends Node2D


func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scene/level1.tscn")
	pass # Replace with function body.

func _on_controls_pressed():
	get_tree().change_scene_to_file("res://Scene/controls.tscn")
	pass # Replace with function body.

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scene/options.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


