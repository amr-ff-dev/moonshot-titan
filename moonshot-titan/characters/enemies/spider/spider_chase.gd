extends SpiderState

class_name SpiderChase

var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")

var target

func _init(chase_target):
	target = chase_target

func physics_process(spider, delta):
	spider.move_and_slide(get_chasing_velocity(spider, delta))

func stop_chase(spider):
	spider.change_state(SpiderIdle.new())

func get_chasing_velocity(spider, delta):
	var path = get_nav_path(spider)
	var nav_target = get_chase_target_from_path(spider.position, path, spider.speed * delta)
	return spider.position.direction_to(nav_target) * spider.speed

func get_nav_path(spider):
	var local_offset = spider.global_position - spider.position
	var path = spider.nav_2d.get_simple_path(spider.position, target.global_position - local_offset)
	if OS.is_debug_build():
		spider.nav_line.points = spider.transform.xform_inv(path)
	return path

func get_chase_target_from_path(origin, path, travel_distance):
	var nav_target = origin
	while travel_distance > 0 and !path.empty():
		travel_distance -= nav_target.distance_to(path[0])
		nav_target = path[0]
		path.remove(0)
	return nav_target
