extends KinematicBody2D

export (int) var speed = 200

func _physics_process(delta):
    move_and_collide(get_normalized_input_vector() * delta * speed)

func get_normalized_input_vector():
    var input_vector = Vector2.ZERO
    input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
    input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
    return input_vector.normalized()
