extends SpiderNav

class_name SpiderChase

var SpiderWander = load("res://characters/enemies/spider/spider_wander.gd")
var SpiderDeadHazard = load("res://characters/enemies/spider/spider_dead_hazard.gd")

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

func check_collisions(spider):
	var collision = spider.first_collision_in(spider.nav_fatal_layers())
	if collision:
		spider.change_state(SpiderDeadHazard.new(collision.collider))
