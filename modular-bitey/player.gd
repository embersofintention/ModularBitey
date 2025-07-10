extends CharacterBody2D

 #variables
var Fella # for calling that node; defined in _ready
var current_animation = "" 
var player_scale = 5

# constants
const SPEED = 600



func _ready() -> void:
	# instance other nodes
	Fella = %PlayerAnimations # call the PlayerAnimations node
	
	# In case you need to see collision stuff to test:
	# get_tree().debug_collisions_hint = true
	


func _physics_process(delta: float) -> void:
	
			# Bite!
	if Input.is_action_just_pressed("bite"):
		Fella.play_bite_animation()
	
	# get direction based on player input
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# set player velocity
	velocity = direction * SPEED
	
	
	# player faces direction
	if direction:
		# if moving horizontally
		if velocity.x != 0 and velocity.y == 0:
			# face the correct direction
			Fella.scale.x = direction.x
		# and keeping scale.y from getting weird
		if velocity.y:
			Fella.scale.y = 1
	
	# player looks towards mouse
	# look_at(get_global_mouse_position())

	
	
	# Animations
	if velocity.length() > 0.0: 
		Fella.play_walk_animation()
	else: 
		Fella.play_idle_animation()
	

		
		
	# apply movement
	move_and_slide()
