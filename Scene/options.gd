extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_master_drag_ended(value_changed):
	$MasterAudio.play()
	pass # Replace with function body.


func _on_music_drag_ended(value_changed):
	$MusicAudio.play()
	pass # Replace with function body.


func _on_sfx_drag_ended(value_changed):
	$SFXAudio.play()
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scene/game.tscn")
	pass # Replace with function body.
