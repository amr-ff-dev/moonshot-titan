extends Node2D

func _on_Player_shoot(Projectile, origin, target):
	var projectile = Projectile.instance()
	add_child(projectile)
	projectile.launch(origin, target)
