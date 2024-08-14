extends Area2D

var light
var animated_sprite
var sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	light = $Light
	animated_sprite = $AnimatedSprite2D
	sprite = $Sprite2D
	animated_sprite.visible = false
	light.light_scale = 0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	
	if body is CharacterBody2D:
		print(body)
		animated_sprite.visible = true
		animated_sprite.play()
		sprite.visible = false
		light.light_scale = 2
