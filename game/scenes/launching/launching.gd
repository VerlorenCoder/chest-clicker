extends Node2D

# =======================================
# Variables (initialized)
# =======================================
var passed_time = 0.0
var counter = 0
var velocity = velocity_initial_value
var direction = UP

# =======================================
# Variables (calculated during runtime)
# =======================================
var title
var title_x
var title_y
var glow

# =======================================
# Enumerations 
# =======================================
enum {UP, DOWN}

# =======================================
# Constants
# =======================================
const counter_limit = 10
const velocity_initial_value = 0.0200
const velocity_increment_value = 0.0100
const rotation_speed = -0.0001

# =======================================
# Overrided functions
# =======================================
func _ready():
	title = get_node("Title")
	glow = get_node("Glow")
	title_x = title.get_pos().x
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	move_up_and_down(delta)
	glow.rotate(rotation_speed)
	
func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT and event.pressed:
		print("Loading main menu scene...")
		get_tree().change_scene("res://scenes/main_menu/main_menu.tscn")
		print("Main menu scene has been loaded successfully.")

# =======================================
# Additional functions
# =======================================
func move_up_and_down(delta):
	passed_time += delta
	
	if passed_time >= velocity:
		passed_time = 0.0
		counter += 1
		velocity += velocity_increment_value

		if direction == UP:
			title_y = title.get_pos().y - 1
		else:
			title_y = title.get_pos().y + 1
			
		title.set_pos(Vector2(title_x, title_y))
		
		if counter >= counter_limit:
			counter = 0
			velocity = velocity_initial_value
			
			if direction == UP:
				direction = DOWN
			else:
				direction = UP