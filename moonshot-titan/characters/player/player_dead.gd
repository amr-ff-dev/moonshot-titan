extends PlayerState

class_name PlayerDead

func enter(player):
	player.animation_player.play("game_over")
	player.emit_game_over()
