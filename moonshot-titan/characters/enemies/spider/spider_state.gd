extends Reference

class_name SpiderState

var SpiderRecoil = load("res://characters/enemies/spider/spider_recoil.gd")

var active = false

func enter(_spider):
	active = true

func exit(_spider):
	active = false

func physics_process(spider, delta):
	if active:
		active_physics_process(spider, delta)

func active_physics_process(_spider, _delta):
	pass

func chase(_spider, _target):
	pass

func stop_chase(_spider):
	pass

func launch(spider, velocity):
	spider.change_state(SpiderRecoil.new(velocity))

func reset(_spider):
	pass
