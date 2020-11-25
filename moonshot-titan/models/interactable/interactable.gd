tool
extends Node2D

class_name Interactable

signal interaction_complete()

export(Texture) var sprite_texture
export(int, 32, 256) var hint_radius = 128
export(int, 32, 256) var click_radius = 64
export(bool) var enabled = true setget set_enabled

onready var sprite = $Sprite
onready var hint_collision_shape_2d = $HintArea/CollisionShape2D
onready var click_collision_shape_2d = $ClickArea/CollisionShape2D
onready var click_area = $ClickArea
onready var animation_player = $AnimationPlayer
onready var progress_bar = $Control/ProgressBar

var interact_duration = 0.0
var interact_enabled = false

func _ready():
	sprite.texture = sprite_texture
	hint_collision_shape_2d.shape.radius = hint_radius
	click_collision_shape_2d.shape.radius = click_radius

func _physics_process(delta):
	if not Engine.editor_hint:
		update_interact_duration(delta)
		update_progress_bar()
		update_completion()

func _on_HintArea_body_entered(_body):
	animation_player.play("hint_entered")

func _on_HintArea_body_exited(_body):
	animation_player.play("hint_exited")

func _on_ClickArea_body_entered(_body):
	interact_enabled = true

func _on_ClickArea_body_exited(_body):
	interact_enabled = false

func set_enabled(value):
	enabled = value
	if not is_inside_tree():
		yield(self, "ready")
	update_monitoring()

func update_monitoring():
	click_area.monitoring = enabled

func update_interact_duration(delta):
	if interact_enabled and Input.is_action_pressed("interact"):
		interact_duration += 100 * delta
	else:
		interact_duration = 0

func update_progress_bar():
	if interact_duration > 0:
		progress_bar.visible = true
		progress_bar.value = interact_duration
	else:
		progress_bar.visible = false

func update_completion():
	if interact_duration >= 100.0:
		click_area.monitoring = false
		interact_enabled = false
		progress_bar.visible = false
		emit_signal("interaction_complete")
