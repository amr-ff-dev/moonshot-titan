extends SpiderNav

class_name SpiderChase

var SpiderWander = load("res://characters/enemies/spider/spider_wander.gd")

var target

func _init(init_target):
	target = init_target

func stop_chase(spider):
	spider.change_state(SpiderIdle.new())

func reset(spider):
	spider.change_state(SpiderWander.new(spider.start_position))

func get_spider_target(spider):
	var local_offset = spider.global_position - spider.position
	return target.global_position - local_offset

func get_first_fatal_collision(spider):
	for i in spider.get_slide_count():
		var collision = spider.get_slide_collision(i)
		if collision.collider.get_collision_layer() == Titan.CollisionLayers.HAZARD:
			return collision
	return null
