extends KinematicBody2D

export(int) var speed = 100

var target

onready var state = SpiderIdle.new()

func _physics_process(delta):
	state.update_physics(self, delta)

func _on_PlayerDetection_chase(body):
	state.chase(self, body)

func _on_PlayerDetection_stop_chase():
	state.stop_chase(self)

func change_state(new_state: SpiderState):
	state = new_state
	state.enter(self)
	
func launch(velocity):
	state.launch(self, velocity)
