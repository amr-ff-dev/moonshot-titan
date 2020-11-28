extends Node2D

class_name GameScene

const scenes = {
	"SplashScreen": "res://user_interface/splash_screen/splash_screen.tscn",
	"Titan": "res://levels/titan/titan.tscn",
	"OutroCredits": "res://user_interface/splash_screen/outro_credits.tscn"
}

func _input(event):
	if event.is_action_pressed("full_screen"):
		get_tree().set_input_as_handled()
		OS.window_fullscreen = !OS.window_fullscreen

func change_scene(scene_name):
	if scene_name in scenes:
		var error = get_tree().change_scene(scenes[scene_name])
		assert(error == OK)
