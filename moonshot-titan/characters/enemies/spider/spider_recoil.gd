extends SpiderState

class_name SpiderRecoil

var velocity
var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")
var SpiderChase = load("res://characters/enemies/spider/spider_chase.gd")
var SpiderDead = load("res://characters/enemies/spider/spider_dead.gd")

func _init(launch_velocity):
	velocity = launch_velocity

func physics_process(spider, delta):
	var collision = spider.move_and_collide(velocity * delta)
	if collision:
		collide(spider, collision)

func collide(spider, collision):
	match collision.collider.get_collision_layer():
		Titan.CollisionLayers.HAZARD:
			spider.change_state(SpiderDead.new())
			disable_hazard_for_enemies(collision.collider)
			move_enemy_to_hazard(spider, collision.collider)
		Titan.CollisionLayers.OBSTACLE, Titan.CollisionLayers.WALL, Titan.CollisionLayers.ENEMY, Titan.CollisionLayers.PLAYER_HAZARD:
			idle_or_chase(spider)

func move_enemy_to_hazard(spider, hazard):
	spider.position = hazard.position

func disable_hazard_for_enemies(hazard):
	hazard.set_collision_layer(Titan.CollisionLayers.PLAYER_HAZARD)

func idle_or_chase(spider):
	if spider.get_node("PlayerDetection").get_overlapping_bodies().size() > 1:
		spider.change_state(SpiderChase.new())
	else:
		spider.change_state(SpiderIdle.new())
