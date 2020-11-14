extends PlayerState

class_name PlayerDead

func enter(player):
	player.animation_player.play("game_over")
	yield(player.animation_player, "animation_finished")
	player.emit_game_over()
