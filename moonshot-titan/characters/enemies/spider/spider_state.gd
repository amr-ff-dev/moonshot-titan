extends Reference

class_name SpiderState

var SpiderRecoil = load("res://characters/enemies/spider/spider_recoil.gd")

func enter(_spider):
	pass

func physics_process(_spider, _delta):
	pass

func chase(_spider, _target):
	pass

func stop_chase(_spider):
	pass

func launch(spider, velocity):
	spider.change_state(SpiderRecoil.new(velocity))
