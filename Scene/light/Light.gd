extends PointLight2D

@export var light_scale :float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.set_texture_scale(light_scale)
	pass
