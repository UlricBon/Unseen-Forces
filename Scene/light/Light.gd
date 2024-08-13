extends PointLight2D

@export var light_scale :float = 1
var frame0 = preload("res://Scene/light/pixil-frame-0.png")
var frame1 = preload("res://Scene/light/pixil-frame-1.png")
var frame2 = preload("res://Scene/light/pixil-frame-2.png")
var frame3 = preload("res://Scene/light/pixil-frame-3.png")
var frames = [frame0,frame1,frame2,frame3]
var iterator = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture(frames[iterator])
	iterator+=1
	#run_frames()
	pass # Replace with function body.

#func run_frames():
	#for i in frames:
		#set_texture(i)
		#OS.delay_msec(2000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.set_texture_scale(light_scale)
	#set_texture(frames[iterator])
	#if iterator == 3:
		#iterator = 0
	#else:
		#iterator +=1
	#OS.delay_msec(2000)
	pass
	
func _on_timer_timeout():
	set_texture(frames[iterator])
	if iterator == 3:
		iterator = 0
	else:
		iterator +=1
