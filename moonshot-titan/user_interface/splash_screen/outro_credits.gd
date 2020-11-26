extends Node2D

func _input(event):
	if event.is_action_pressed("full_screen"):
		get_tree().set_input_as_handled()
		OS.window_fullscreen = !OS.window_fullscreen
