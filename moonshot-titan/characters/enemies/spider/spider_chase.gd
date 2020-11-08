extends SpiderState

class_name SpiderChase

var SpiderIdle = load("res://characters/enemies/spider/spider_idle.gd")

func update_physics(spider, _delta):
	spider.move_and_slide(get_chasing_velocity(spider))

func stop_chase(spider):
	spider.change_state(SpiderIdle.new())

func get_chasing_velocity(spider):
	if spider.target:
		return spider.position.direction_to(spider.target.position) * spider.speed
	else:
		return Vector2.ZERO
