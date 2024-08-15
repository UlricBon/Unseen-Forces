extends Node2D


const speed = 60
var direction = -1

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_up = $RayCastUp
@onready var ray_cast_down = $RayCastDown


func _process(delta):
	
	if ray_cast_up.is_colliding():
		direction = 1
	if ray_cast_down.is_colliding():
		direction = -1
	position.y += direction * speed * delta
