extends SpiderState

class_name SpiderDead

func enter(spider):
	spider.emit_dead()
	spider.rotate(PI)
	spider.nav_line.queue_free()

func chase(_spider, _target):
	pass

func launch(_spider, _velocity):
	pass
