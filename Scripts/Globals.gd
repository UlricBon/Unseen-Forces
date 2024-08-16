extends Node

var qwerty = 100
var timer
var elapsed_time : float = 0.0
var timer_started : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_timer():
	elapsed_time = 0.0
	timer_started = true

func stop_timer():
	timer_started = false

func get_elapsed_time() -> float:
	return elapsed_time

func _process(delta):
	if timer_started:
		elapsed_time += delta

func change_val(num):
	qwerty = num


