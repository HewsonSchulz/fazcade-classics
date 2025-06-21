extends Node2D

# quit game
func _input(e):
	if e.is_action_pressed("esc"):
		get_tree().quit()
