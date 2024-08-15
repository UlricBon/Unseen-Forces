extends Node2D

const speed = 40
var direction = -1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_ground_right = $RayCastGroundRight
@onready var ray_cast_ground_left = $RayCastGroundLeft


func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if direction == 1 and not ray_cast_ground_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if direction == -1 and not ray_cast_ground_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * speed * delta
