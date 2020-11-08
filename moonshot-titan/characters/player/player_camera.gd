extends Camera2D

const MAX_ZOOM = Vector2(2,2)
const MIN_ZOOM = Vector2(1,1)
const ZOOM_INTERVALS = 10

var ZOOM_FRICTION = (MAX_ZOOM - MIN_ZOOM).length() / ZOOM_INTERVALS

func zoom_in():
	zoom = zoom.move_toward(MIN_ZOOM, ZOOM_FRICTION)

func zoom_out():
	zoom = zoom.move_toward(MAX_ZOOM, ZOOM_FRICTION)
