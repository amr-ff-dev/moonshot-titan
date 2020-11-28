extends PlayerState

class_name PlayerDead

func enter(player):
	player.emit_damaged()
	player.animation_player.play("game_over")
	yield(player.animation_player, "animation_finished")
	player.emit_game_over()

func input(player, event):
	.input(player, event)
	if event.is_action_pressed("interact"):
		player.get_tree().set_input_as_handled()
