extends Area2D

signal chase(body)
signal stop_chase()

func _on_PlayerDetection_body_entered(body):
	if body.get_collision_layer() == Titan.CollisionLayers.PLAYER:
		emit_signal("chase", body)


func _on_PlayerDetection_body_exited(body):
	if body.get_collision_layer() == Titan.CollisionLayers.PLAYER:
		emit_signal("stop_chase")
