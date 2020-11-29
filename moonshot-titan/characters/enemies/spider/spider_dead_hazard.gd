extends SpiderDead

class_name SpiderDeadHazard

var hazard

func _init(init_hazard):
	hazard = init_hazard

func enter(spider):
	.enter(spider)
	disable_hazard_for_enemies()
	move_enemy_to_hazard(spider)

func move_enemy_to_hazard(spider):
	spider.position = hazard.position

func disable_hazard_for_enemies():
	hazard.set_collision_layer(Titan.CollisionLayers.PLAYER_HAZARD)
