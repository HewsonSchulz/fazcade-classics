extends Node2D


# hide mouse
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# quit game
func _input(e):
	if e.is_action_pressed("esc"):
		get_tree().quit()
