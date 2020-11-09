extends SpiderState

class_name SpiderRecoil

var velocity
var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")
var SpiderChase = load("res://characters/enemies/spider/spider_chase.gd")
var SpiderDead = load("res://characters/enemies/spider/spider_dead.gd")

func _init(launch_velocity):
	velocity = launch_velocity

func update_physics(spider, delta):
	var collision = spider.move_and_collide(velocity * delta)
	if collision:
		collide(spider, collision)

func collide(spider, collision):
	match collision.collider.get_collision_layer():
		Titan.CollisionLayers.HAZARD:
			spider.change_state(SpiderDead.new())
		Titan.CollisionLayers.OBSTACLE, Titan.CollisionLayers.WALL, Titan.CollisionLayers.ENEMY:
			idle_or_chase(spider)

func idle_or_chase(spider):
	if spider.get_node("PlayerDetection").get_overlapping_bodies().size() > 1:
		spider.change_state(SpiderChase.new())
	else:
		spider.change_state(SpiderIdle.new())
