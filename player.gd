extends CharacterBody2D

const JUMP_VELOCITY = -1400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 4.0
@onready var animacja = get_node("AnimationPlayer")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animacja.play("jump")

	# Set velocity to move always to the right.
	velocity.x = Global.SPEED
	
	

	# Check if the character is on the floor before playing the run animation.
	if is_on_floor():
		if velocity.y==0:
			animacja.play("run")
	else:
		if velocity.y==0:
			animacja.play("idle")
		if velocity.y > 0:
			animacja.play("fall")

	move_and_slide()
	
#fall through platforms
func _input(event):
	if(event.is_action_pressed("down") && is_on_floor()):
		position.y += 1
