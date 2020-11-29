extends SpiderState

class_name SpiderNav

var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")
var SpiderDeadHazard = load("res://characters/enemies/spider/spider_dead_hazard.gd")

func active_physics_process(spider, delta):
	if should_spider_nav(spider):
		spider.move_and_slide(get_chasing_velocity(spider, delta))
		var collision = get_first_fatal_collision(spider)
		if collision:
			spider.change_state(SpiderDeadHazard.new(collision.collider))
		elif !should_spider_continue_nav(spider):
			stop_nav(spider)
	else:
		stop_nav(spider)

func stop_nav(spider):
	spider.change_state(SpiderIdle.new())

func get_spider_target(spider):
	return spider.position

func should_spider_nav(_spider):
	return true

func should_spider_continue_nav(_spider):
	return true

func get_first_fatal_collision(_spider):
	return null
	
func get_chasing_velocity(spider, delta):
	var path = get_nav_path(spider)
	var nav_target = get_chase_target_from_path(spider.position, path, spider.speed * delta)
	return spider.position.direction_to(nav_target) * spider.speed

func get_nav_path(spider):
	var path = spider.nav_2d.get_simple_path(spider.position, get_spider_target(spider))
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
