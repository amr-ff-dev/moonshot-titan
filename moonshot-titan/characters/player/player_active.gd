extends PlayerState

class_name PlayerActive

var PlayerDead = load("res://characters/player/player_dead.gd")

var velocity = Vector2.ZERO
var desired_velocity = Vector2.ZERO

func physics_process(player, delta):
	velocity = velocity.linear_interpolate(desired_velocity, player.acceleration)
	var collision = player.move_and_collide(velocity * delta)
	if player.collision_is_stopping(collision):
		velocity = velocity.slide(collision.normal)
	elif player.collision_is_fatal(collision):
		player.change_state(PlayerDead.new())

func input(player, event):
	.input(player, event)
	if event.is_action_pressed("shoot"):
		.shoot(player)
	else:
		update_desired_velocity(player)

func update_desired_velocity(player):
	desired_velocity = get_normalized_input_vector() * player.speed

func get_normalized_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input_vector.normalized()
