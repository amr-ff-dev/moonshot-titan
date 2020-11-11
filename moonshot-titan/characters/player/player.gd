extends KinematicBody2D

signal shoot(projectile, origin, direction)
signal game_over()

export(int) var speed = 200
export(float, 0, 1, 0.1) var acceleration = 0.2

const stopping_layers = [Titan.CollisionLayers.WALL, Titan.CollisionLayers.OBSTACLE]
const fatal_layers = [Titan.CollisionLayers.ENEMY, Titan.CollisionLayers.HAZARD, Titan.CollisionLayers.PLAYER_HAZARD]

onready var animation_player = $AnimationPlayer
onready var camera = $PlayerCamera

var state = PlayerActive.new()

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

func emit_shoot(projectile, origin, direction):
	emit_signal("shoot", projectile, origin, direction)

func emit_game_over():
	emit_signal("game_over")

func respawn(respawn_point):
	change_state(PlayerRespawn.new(respawn_point))
