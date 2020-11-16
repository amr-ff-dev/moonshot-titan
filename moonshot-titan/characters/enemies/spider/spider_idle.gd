extends SpiderState

class_name SpiderIdle

var SpiderChase = load("res://characters/enemies/spider/spider_chase.gd")

func chase(spider, target):
	spider.change_state(SpiderChase.new(target))
