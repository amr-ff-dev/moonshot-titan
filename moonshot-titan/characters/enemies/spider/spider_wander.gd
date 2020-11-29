extends SpiderNav

class_name SpiderWander

var home_target = null
var wander_target = null
var rng

const MINIMUM_NAV_DISTANCE = 16.0

func _init(init_target):
	home_target = init_target
	rng = RandomNumberGenerator.new()
	rng.randomize()

func chase(spider, target):
	spider.change_state(SpiderChase.new(target))

func get_spider_target(spider):
	return spider.nav_2d.get_closest_point(get_wander_target(spider))

func should_spider_nav(spider):
	if get_spider_target(spider).distance_to(spider.position) >= MINIMUM_NAV_DISTANCE:
		return true
	else:
		return false

func check_collisions(spider):
	var collision = spider.first_collision_in(spider.nav_reset_layers())
	if collision:
		spider.change_state(SpiderIdle.new())

func get_wander_target(spider):
	if !wander_target:
		set_wander_target(spider)
	return wander_target

func set_wander_target(spider):
	wander_target = home_target + get_wander_offset(spider.wander_radius)

func get_wander_offset(radius):
	var normalized_offset = Vector2(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0)).normalized()
	return normalized_offset * rng.randf_range(MINIMUM_NAV_DISTANCE, radius)
