extends SpiderState

class_name SpiderIdle

var SpiderChase = load("res://characters/enemies/spider/spider_chase.gd")
var SpiderWander = load("res://characters/enemies/spider/spider_wander.gd")

const MIN_IDLE_TIME = 0.5
const MAX_IDLE_TIME = 3.0

var target_idle_time = 0.0
var idle_time = 0.0

func _init():
	var 	rng = RandomNumberGenerator.new()
	rng.randomize()
	target_idle_time = rng.randf_range(MIN_IDLE_TIME, MAX_IDLE_TIME)

func active_physics_process(spider, delta):
	idle_time += delta
	if idle_time >= target_idle_time:
		spider.change_state(SpiderWander.new(spider.start_position))

func chase(spider, target):
	spider.change_state(SpiderChase.new(target))
