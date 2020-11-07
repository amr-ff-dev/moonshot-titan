extends Node2D

class_name Titan

enum CollisionLayers {
	WALL = 1,
	PLAYER = 2,
	ENEMY = 4,
	PROJECTILE = 8,
	HAZARD = 16,
	OBSTACLE = 32,
}

onready var player = $Player
onready var restart_button = $HUD/Restart
onready var player_respawn = $PlayerRespawn

func _on_Player_shoot(projectile, origin, direction):
	add_child(projectile)
	projectile.launch(origin, direction)

func _on_Player_game_over():
	restart_button.visible = true


func _on_Restart_pressed():
	player.respawn(player_respawn)
	restart_button.visible = false
