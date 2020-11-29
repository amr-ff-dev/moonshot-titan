extends Node2D

signal player_entered(player)

onready var animation_player = $AnimationPlayer

var open = true
var keep_open = false

func _on_EntranceDetection_body_entered(body):
	emit_signal("player_entered", body)

func _on_DoorTrigger_body_entered(_body):
	close_door()

func close_door():
	if open and !keep_open:
		open = false
		animation_player.play("close_door")

func open_door():
	if !open:
		open = true
		animation_player.play("open_door")

func open_permanently():
	keep_open = true
	open_door()
