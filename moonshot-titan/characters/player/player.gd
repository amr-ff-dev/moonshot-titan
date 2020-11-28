extends KinematicBody2D

signal shoot(projectile, origin, direction)
signal damaged()
signal game_over()

export(int) var speed = 200
export(float, 0, 1, 0.1) var acceleration = 0.2

const stopping_layers = [Titan.CollisionLayers.WALL, Titan.CollisionLayers.OBSTACLE]
const fatal_layers = [Titan.CollisionLayers.ENEMY, Titan.CollisionLayers.HAZARD, Titan.CollisionLayers.PLAYER_HAZARD]

onready var animation_player = $AnimationPlayer
onready var camera = $PlayerCamera
onready var grav_detect = $GravDetect
onready var sprite = $Sprite

var state

func _ready():
	change_state(PlayerActive.new())

func _physics_process(delta):
	state.physics_process(self, delta)

func _input(event):
	state.input(self, event)

func change_state(new_state):
	state = new_state
	state.enter(self)

func collision_is_stopping(collision):
	return collision and collision.collider.get_collision_layer() in stopping_layers

func collision_is_fatal(collision):
	return collision and collision.collider.get_collision_layer() in fatal_layers

func is_in_grav_area():
	for area in grav_detect.get_overlapping_areas():
		if area.collision_layer == Titan.CollisionLayers.GRAV:
			return true
	return false

func is_grav_locked():
	return Input.is_action_pressed("grav") and is_in_grav_area()

func emit_shoot(projectile, origin, direction):
	emit_signal("shoot", projectile, origin, direction)

func emit_damaged():
	emit_signal("damaged")

func emit_game_over():
	emit_signal("game_over")

func respawn(respawn_point):
	change_state(PlayerRespawn.new(respawn_point))

func change_suit(texture):
	sprite.texture = texture
