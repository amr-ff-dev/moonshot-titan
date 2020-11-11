extends PlayerState

class_name PlayerRecoil

var PlayerActive = load("res://characters/player/player_active.gd")
var PlayerDead = load("res://characters/player/player_dead.gd")

var velocity

func _init(recoil_velocity):
	velocity = recoil_velocity

func physics_process(player, delta):
	var collision = player.move_and_collide(velocity * delta)
	if player.collision_is_stopping(collision):
		player.change_state(PlayerActive.new())
	elif player.collision_is_fatal(collision):
		player.change_state(PlayerDead.new())

func input(player, event):
	.input(player, event)
	if event.is_action_pressed("shoot"):
		.shoot(player)
