extends SpiderNav

class_name SpiderWander

var target

const MINIMUM_NAV_DISTANCE = 8

func _init(home_target):
	target = home_target

func get_spider_target(spider):
	return target

func should_spider_nav(spider):
	if target.distance_to(spider.position) >= MINIMUM_NAV_DISTANCE:
		return true
	else:
		return false
