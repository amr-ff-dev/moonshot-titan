extends SpiderState

class_name SpiderRecoil

var velocity
var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")
var SpiderChase = load("res://characters/enemies/spider/spider_chase.gd")
var SpiderDeadHazard = load("res://characters/enemies/spider/spider_dead_hazard.gd")

func _init(launch_velocity):
	velocity = launch_velocity

func active_physics_process(spider, delta):
	var collision = spider.move_and_collide(velocity * delta)
	if collision:
		collide(spider, collision)

func collide(spider, collision):
	match collision.collider.get_collision_layer():
		Titan.CollisionLayers.HAZARD:
			spider.change_state(SpiderDeadHazard.new(collision.collider))
		Titan.CollisionLayers.OBSTACLE, Titan.CollisionLayers.WALL, Titan.CollisionLayers.ENEMY, Titan.CollisionLayers.PLAYER_HAZARD:
			idle_or_chase(spider)

func idle_or_chase(spider):
	var target = find_player_target_in_detection_area(spider)
	if target:
		spider.change_state(SpiderChase.new(target))
	else:
		spider.change_state(SpiderIdle.new())

func find_player_target_in_detection_area(spider):
	for body in spider.player_detection.get_overlapping_bodies():
		if body.get_collision_layer() == Titan.CollisionLayers.PLAYER:
			return body
	return null
