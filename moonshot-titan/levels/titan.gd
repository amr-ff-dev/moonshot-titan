extends Node2D

class_name Titan

enum CollisionLayers {
	WALL = 1,
	PLAYER = 2,
	ENEMY = 4,
	PROJECTILE = 8,
	HAZARD = 16
}

func _on_Player_shoot(projectile, origin, direction):
	add_child(projectile)
	projectile.launch(origin, direction)
