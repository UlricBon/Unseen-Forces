extends CanvasLayer

@onready var interact_radius = $interact_radius
@onready var pbar = $TextureProgressBar
var score
var burning = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#score = get_parent().get_node("GameManager").score
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if burning:
		pbar.value -= 1
	pass

func _input(event):
	score = get_parent().get_node("GameManager").score
	if event.is_action_pressed("Interact") and event.is_pressed() and score:
		burning = true
	elif event.is_action_released("Interact"):
		burning = false

