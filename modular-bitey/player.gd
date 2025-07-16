extends CharacterBody2D

 #variables
var Fella # for calling that node; defined in _ready
var current_animation = "" 
var player_scale = 5
var isBiting = false

# constants
const SPEED = 600



func _ready() -> void:
	# instance other nodes
	Fella = %PlayerAnimations
	# get_tree().debug_collisions_hint = true
	# ! define helper functions later
	
# Helper Function -- Only change animations when needed, not every frame


func _physics_process(_delta: float) -> void:
	
	var direction;
	
	#CHEESYPOCKETS: This actually attemmps to the play the animation. What is happening 
	#Is when the animation attemps to play Input.Is_Action_Just_Pressed("bite") is likely
	#returning false on the next frame. 
			# Bite!
	
	#update. Now I ese that the animation finishes, but bite is not changing
	
	#make sure bite is not already playing by detecting if the character "Is biting"
	if Input.is_action_just_pressed("bite") && !(isBiting):
		#set is attacking to true so the animation actually continues
		isBiting = true;
		
		#Fix here: I queued the next animation idle 1. This way here we can
		#return what the current animation is 
		Fella.play_bite_animation();
		
	
	# see if the character is in a state of "biting" before taking up other actions
	# get direction based on player input
	if(Fella.current_animation != "bite"):
		isBiting = false;
		direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
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
	# look_at(get_global_mouse_position()):
	# Animations
		if velocity.length() == 0.0: 
			Fella.play_idle_animation();
			
		else: 
			Fella.play_walk_animation();
	
	#This was for debug to see where the animation was currently and if condition was working
	#print_debug(Fella.return_current_animation());
	#print_debug(isBiting);

		
		
	# apply movement
	move_and_slide()

