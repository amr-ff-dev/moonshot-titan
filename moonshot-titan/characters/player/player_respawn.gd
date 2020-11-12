extends PlayerState

class_name PlayerRespawn

var PlayerActive = load("res://characters/player/player_active.gd")

var respawn_point

func _init(current_respawn_point):
	respawn_point = current_respawn_point

func enter(player):
	player.position = respawn_point.global_position
	player.animation_player.play_backwards("game_over")
	yield(player.animation_player, "animation_finished")
	player.change_state(PlayerActive.new())
