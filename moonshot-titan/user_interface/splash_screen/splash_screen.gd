extends Node2D

var titan_path = "res://levels/titan/titan.tscn"

func _on_Start_pressed():
	get_tree().change_scene(titan_path)

func _input(event):
	if event.is_action_pressed("full_screen"):
		get_tree().set_input_as_handled()
		OS.window_fullscreen = !OS.window_fullscreen
