extends Control

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
var chest
var chest_y
var chest_x

# =======================================
# Enumerations 
# =======================================
enum {UP, DOWN}

# =======================================
# Constants
# =======================================
const counter_limit = 20
const velocity_initial_value = 0.0050
const velocity_increment_value = 0.0025

# =======================================
# Overrided functions
# =======================================
func _ready():
	chest = get_node("Chest")
	chest_x = chest.get_pos().x
	set_process(true)
	pass
	
func _process(delta):
	passed_time += delta
	
	if passed_time >= velocity:
		passed_time = 0.0
		counter += 1
		velocity += velocity_increment_value
		
		if direction == UP:
			chest_y = chest.get_pos().y - 1
		else:
			chest_y = chest.get_pos().y + 1
			
		chest.set_pos(Vector2(chest_x, chest_y))
		
		if counter >= counter_limit:
			counter = 0
			velocity = velocity_initial_value
			
			if direction == UP:
				direction = DOWN
			else:
				direction = UP