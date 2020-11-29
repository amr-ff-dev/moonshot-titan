extends SpiderState

class_name SpiderDead

func enter(spider):
	.enter(spider)
	spider.emit_dead()
	spider.sprite.rotate(PI)
	spider.nav_line.queue_free()

func launch(_spider, _velocity):
	pass
