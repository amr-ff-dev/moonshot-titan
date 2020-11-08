extends Reference

class_name SpiderState

var SpiderRecoil = load("res://characters/enemies/spider/spider_recoil.gd")

func enter(spider):
	pass

func update_physics(spider, _delta):
	pass

func chase(spider, target):
	spider.target = target

func stop_chase(spider):
	pass

func launch(spider, velocity):
	spider.change_state(SpiderRecoil.new(velocity))
