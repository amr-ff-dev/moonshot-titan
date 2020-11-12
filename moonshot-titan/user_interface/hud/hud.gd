extends CanvasLayer

class_name HUD

signal restart()

func _on_Restart_pressed():
	emit_signal("restart")
