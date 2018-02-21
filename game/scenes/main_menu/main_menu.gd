extends Control

# =======================================
# Variables (initialized)
# =======================================
onready var label_new_game = get_node("New game")
onready var label_achievements = get_node("Achievements")
onready var label_load_game = get_node("Load game")
onready var label_options = get_node("Options")
onready var label_help = get_node("Help")
onready var label_credits = get_node("Credits")
onready var label_secrets = get_node("Secrets")
onready var label_quit = get_node("Quit")

onready var outline = label_new_game.get("custom_constants/shadow_as_outline")
onready var outline_color = label_new_game.get("custom_colors/font_color_shadow")

onready var blank_outline = label_quit.get("custom_constants/shadow_as_outline")
onready var blank_outline_color = label_quit.get("custom_colors/font_color_shadow")

var active_label = NEW_GAME


# =======================================
# Enumerations 
# =======================================
enum {NEW_GAME, ACHIEVEMENTS, LOAD_GAME, OPTIONS, HELP, CREDITS, SECRETS, QUIT}

# =======================================
# Overrided functions
# =======================================
func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_down") and active_label < QUIT:
		active_label += 1
		update_highlighting(active_label - 1)
	elif event.is_action_pressed("ui_up") and active_label > NEW_GAME:
		active_label -= 1
		update_highlighting(active_label + 1)

# =======================================
# Additional functions
# =======================================
func update_highlighting(label_to_disable):
	var disabled_label = get_label(label_to_disable)
	var enabled_label = get_label(active_label)
	
	disabled_label.set("custom_colors/font_color_shadow", blank_outline)
	disabled_label.set("custom_constants/shadow_as_outline", blank_outline_color)
	
	enabled_label.set("custom_colors/font_color_shadow", outline_color)
	enabled_label.set("custom_constants/shadow_as_outline", outline)

func get_label(label_name):
	if label_name == NEW_GAME:
		return label_new_game
	elif label_name == ACHIEVEMENTS:
		return label_achievements
	elif label_name == LOAD_GAME:
		return label_load_game
	elif label_name == OPTIONS:
		return label_options
	elif label_name == HELP:
		return label_help
	elif label_name == CREDITS:
		return label_credits
	elif label_name == SECRETS:
		return label_secrets
	elif label_name == QUIT:
		return label_quit
	else:
		print("ERROR! Unhandled label has been chosen!")
		return -1

