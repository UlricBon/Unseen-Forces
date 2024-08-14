extends CanvasLayer

@onready var interact_radius = $interact_radius

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("Interact") and event.is_pressed():
		interact_radius.start_time()
	elif event.is_action_released("Interact"):
		interact_radius.stop_time()
