extends StaticBody2D

var light
# Called when the node enters the scene tree for the first time.
func _ready():
	light = $Light
	light.set_texture_scale(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		print(body)
		light.set_texture_scale(1)
	
	pass # Replace with function body.
