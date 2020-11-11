extends Reference

class_name PlayerState

var RepulsorProjectile = preload("res://models/repulsor_projectile/repulsor_projectile.tscn")
var PlayerRecoil = load("res://characters/player/player_recoil.gd")

func enter(_player):
	pass

func physics_process(_player, _delta):
	pass

func input(player, event):
	if event.is_action_pressed("zoom_in"):
		player.camera.zoom_in()
	elif event.is_action_pressed("zoom_out"):
		player.camera.zoom_out()

func shoot(player):
	var target = player.get_global_mouse_position()
	var direction_to_target = player.position.direction_to(target).normalized()
	var projectile = RepulsorProjectile.instance()

	player.emit_shoot(projectile, player.position, direction_to_target)
	
	player.change_state(PlayerRecoil.new(-direction_to_target * projectile.speed))
