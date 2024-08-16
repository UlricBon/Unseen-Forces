extends CanvasLayer

@onready var interact_radius = $interact_radius
@onready var pbar = $TextureProgressBar
var burning = false
@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#score = get_parent().get_node("GameManager").score
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if burning:
		pbar.value -= 1
		if pbar.value <= 0:
			burning = false
			player.burning = false
	pass

func _input(event):
	if event.is_action_pressed("Interact") and event.is_pressed() and pbar.value > 0:
		burning = true
		player.burning = true
	elif event.is_action_released("Interact"):
		burning = false
		player.burning = false

