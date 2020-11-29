extends KinematicBody2D

class_name Spider

signal dead()

export(int) var speed = 100
export(NodePath) var nav_2d_path
export(float, 50.0, 200.0, 1.0) var wander_radius = 100

onready var state
onready var nav_2d : Navigation2D = get_node(nav_2d_path)
onready var nav_line = $NavLine
onready var player_detection = $PlayerDetection
onready var sprite = $Sprite
onready var start_position = position

func _ready():
	change_state(SpiderIdle.new())

func _physics_process(delta):
	state.physics_process(self, delta)

func _on_PlayerDetection_chase(body):
	state.chase(self, body)

func _on_PlayerDetection_stop_chase():
	state.stop_chase(self)

func change_state(new_state: SpiderState):
	if state:
		state.exit(self)
	state = new_state
	state.enter(self)
	
func launch(velocity):
	state.launch(self, velocity)

func reset():
	state.reset(self)

func emit_dead():
	emit_signal("dead")
