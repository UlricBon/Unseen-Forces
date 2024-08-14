extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var interact_radius = $interact_radius

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var interact_object

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("Interact"):
		pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Running")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _input( event ):
	if event.is_action_pressed("Interact") and event.is_pressed():
		interact_radius.start_time()
	elif event.is_action_released("Interact"):
		interact_radius.stop_time()

#var interact_object

func _on_interact_radius_body_entered(body):
	print("entered" + str(body))
	if body.is_in_group("torch"):
		print(body)
		print("torchhhh")
		interact_object = body
	pass # Replace with function body.

func _on_interact_radius_interact():
	interact_object.light_up()
	pass # Replace with function body.


func _on_interact_radius_area_entered(area):
	print(area)
	interact_object = area
	pass # Replace with function body.
