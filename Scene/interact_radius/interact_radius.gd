extends Area2D

@onready var timer = $Timer
@onready var pbar = $TextureProgressBar
signal interact

# Called when the node enters the scene tree for the first time.
func _ready():
	pbar.visible =false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pbar.value = timer.wait_time - timer.time_left
	pass
	
func start_time():
	timer.start()
	pbar.visible = true
	print("timer started")

func stop_time():
	timer.stop()
	pbar.visible = false
	print("timer stopped")
	


func _on_timer_timeout():
	interact.emit()
	print("reached 5 seconds")
	pass # Replace with function body.
