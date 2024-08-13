extends StaticBody2D

var light
var animated_sprite
var sprite
@onready var fire_start = $fire_start
# Called when the node enters the scene tree for the first time.
func _ready():
	light = $Light
	animated_sprite = $AnimatedSprite2D
	sprite = $Sprite2D
	animated_sprite.visible = false
	light.light_scale = 0
	#light_up()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



#func _on_area_2d_body_entered(body):
	#if body is CharacterBody2D:
		##print(body)
		#animated_sprite.visible = true
		#animated_sprite.play()
		#sprite.visible = false
		#light.light_scale = 2
	#
	#pass # Replace with function body.
	
func light_up():
	animated_sprite.visible = true
	animated_sprite.play()
	fire_start.play()
	sprite.visible = false
	light.light_scale = 2
	
