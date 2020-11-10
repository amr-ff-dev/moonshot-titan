extends SpiderState

class_name SpiderChase

var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")

func update_physics(spider, delta):
	spider.move_and_slide(get_chasing_velocity(spider, delta))

func stop_chase(spider):
	spider.change_state(SpiderIdle.new())

func get_chasing_velocity(spider, delta):
	if spider.target:
		var path = get_nav_path_to(spider)
		var nav_target = get_chase_target_from_path(spider.position, path, spider.speed * delta)
		return spider.position.direction_to(nav_target) * spider.speed
	else:
		return Vector2.ZERO

func get_nav_path_to(spider):
	var local_offset = spider.global_position - spider.position
	var path = spider.nav_2d.get_simple_path(spider.position, spider.target.global_position - local_offset)
	if OS.is_debug_build():
		spider.nav_line.points = spider.transform.xform_inv(path)
	return path

func get_chase_target_from_path(origin, path, travel_distance):
	var target = origin
	while travel_distance > 0 and !path.empty():
		travel_distance -= target.distance_to(path[0])
		target = path[0]
		path.remove(0)
	return target
