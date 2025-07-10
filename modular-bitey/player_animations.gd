extends Node2D


# variables
var current_animation := "" # for animation helper function
var this_node = ""

func _ready() -> void:
	# return to other stuff
	%AnimationPlayer.connect("animation_finished", Callable(self, "_on_animation_finished"))
	# set this_node to node's name
	this_node == name
	

# ANIMATION HELPER (not sure if working yet?)
func _on_animation_finished(anim_name):
	if current_animation == anim_name:
		current_animation = ""


# HELPER FUNCTION:  play animation only if different
func change_animation(anim_name: String):
	if current_animation != anim_name: 
		%AnimationPlayer.play(anim_name)
		current_animation = anim_name

func clear_and_queue_animation(anim_name: String):
	if current_animation != anim_name: 
		%AnimationPlayer.clear_queue()
		%AnimationPlayer.queue(anim_name)
		current_animation = anim_name

func play_idle_animation(): 
	# %AnimationPlayer.play("idle")
	change_animation("idle1")


func play_walk_animation():
	# %AnimationPlayer.play("walk")
	change_animation("run2")

func play_bite_animation(): #NOT CURRENTLY WORKING! fix it later
	# %AnimationPlayer.play("bite")
	# change_animation("bite")
	clear_and_queue_animation("bite")
	print_debug("Bite!")
	
	
func play_test_animation():
	#%AnimationPlayer.play("TEST")
	change_animation("TEST")
	
 #func _on_animation_finished(anim_name):
