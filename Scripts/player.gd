extends CharacterBody2D


var SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var light = $Light
@onready var cpu_particles_2d = $CPUParticles2D
@onready var cpu_particles_2d_2 = $CanvasLayer/CPUParticles2D2
@onready var cpu_particles_2d_3 = $CPUParticles2D3
@onready var slow_timer = $SlowTimer
@onready var canvas_layer = $CanvasLayer


const MAXFUEL = 5000
var FUEL = 5000
var lightBool = false
var playerDeath = false
var playerSlow = false
var buffered_jump = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var interact_object

var burning = false

var coyote_time = 0.1
var can_jump = false

func _physics_process(delta):
	
	if Input.is_action_just_pressed("Retry"):
		print("retry")
		get_tree().reload_current_scene()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if burning:
		print("plyaer is bunring")
	
	# Handle jump.
	if is_on_floor() and can_jump == false:
		can_jump = true
	elif can_jump == true and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start(coyote_time)
	
	if can_jump:
		if Input.is_action_just_pressed("Jump") or buffered_jump == true:
			velocity.y = JUMP_VELOCITY
			buffered_jump = false
	else:
		if Input.is_action_just_pressed("Jump"):
			buffered_jump = true
			$JumpBufferTimer.start()
	#^^^ BINAGO KO TO LINAGYAN KO NG JUMP BUFFERING, PARA BAGO LUMAPAG MAKAKATALON AGAD SI PLAYER	
		
	if Input.is_action_just_pressed("Interact"):
		pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	
	if playerDeath:
		animated_sprite_2d.visible = false
		light.visible = false
		cpu_particles_2d_2.global_position = global_position
		cpu_particles_2d_2.initial_velocity_max = velocity.x * 1.5
		cpu_particles_2d_2.emitting = true
	else:
		var is_on_floor = is_on_floor()
		if playerSlow:
			SPEED = 50
			var raw_color = Color()  
			raw_color.r = 1
			raw_color.g = 1 
			raw_color.b = 1  
			raw_color.a = 1
			animated_sprite_2d.self_modulate =  raw_color
			light.light_scale = 0.5
			light.offset.y = -3
			if is_on_floor:
				if direction == 0:
					animated_sprite_2d.play("Unlit Idle")
				else:
					play_footsteps()
					animated_sprite_2d.play("Unlit Running")
		else:
			SPEED = 100
			var raw_color = Color()  
			raw_color.r = 2
			raw_color.g = 3 
			raw_color.b = 3  
			raw_color.a = 1
			animated_sprite_2d.self_modulate =  raw_color
			if lightBool:
				lightBool = true
				light.light_scale *= 1.02
				light.offset.y *= 1.024
				SPEED = 150
				if is_on_floor:
					if direction == 0:
						animated_sprite_2d.play("Lit Up Idle")
					else:
						play_footsteps()
						animated_sprite_2d.play("Lit Up Running")
			else:
				if is_on_floor:
					if direction == 0:
						animated_sprite_2d.play("Idle")
					else:
						play_footsteps()
						animated_sprite_2d.play("Running")
				if light.light_scale <= 1.5 and light.offset.y <= 1:
					light.light_scale = 1.5
					light.offset.y = 1
				else:
					light.light_scale /= 1.02
					light.offset.y /= 1.024
			
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if direction < 0:
		animated_sprite_2d.flip_h = true

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _input( event ):
	
	if event.is_action_pressed("Interact") and event.is_pressed() and burning:
		lightBool = true
		cpu_particles_2d_3.emitting = true
	elif event.is_action_released("Interact") || !burning:
		lightBool = false
		cpu_particles_2d_3.emitting = false
		SPEED = 100
#var interact_object

func _on_interact_radius_body_entered(body):
	print("entered" + str(body))
	if body.is_in_group("torch"):
		print(body)
		print("torchhhh")
		interact_object = body
	pass # Replace with function body.

func _on_interact_radius_interact():
	if interact_object:
		interact_object.light_up()
	pass # Replace with function body.


func _on_interact_radius_area_entered(area):
	print(area)
	interact_object = area
	pass # Replace with function body.


func _on_interact_radius_area_exited(area):
	interact_object = null
	pass # Replace with function body.
	
# Function for playing footstep audio
func play_footsteps():
	var wait_time = 0.25
	if $FootstepAudioTimer.time_left <= 0:
		$FootstepSFX.pitch_scale = randf_range(1, 1.5)
		$FootstepSFX.play()
		if burning:
			$FootstepAudioTimer.start(0.2)
		else:
			$FootstepAudioTimer.start(0.3)
		
func _on_slow_timer_timeout():
	print("stopppp")
	playerSlow = false
	SPEED = 100


func _on_jump_buffer_timer_timeout():
	buffered_jump = false
	pass # Replace with function body.


func _on_coyote_timer_timeout():
	can_jump = false
	pass # Replace with function body.
