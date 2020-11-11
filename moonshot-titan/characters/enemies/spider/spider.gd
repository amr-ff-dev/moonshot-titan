extends KinematicBody2D

export(int) var speed = 100
export(NodePath) var nav_2d_path

var target

onready var state = SpiderIdle.new()
onready var nav_2d : Navigation2D = get_node(nav_2d_path)
onready var nav_line = $NavLine

func _physics_process(delta):
	state.physics_process(self, delta)

func _on_PlayerDetection_chase(body):
	state.chase(self, body)

func _on_PlayerDetection_stop_chase():
	state.stop_chase(self)

func change_state(new_state: SpiderState):
	state = new_state
	state.enter(self)
	
func launch(velocity):
	state.launch(self, velocity)
