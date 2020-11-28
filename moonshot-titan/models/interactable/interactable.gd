tool
extends Node2D

class_name Interactable

signal interaction_complete()

export(Texture) var sprite_texture setget set_sprite_texture
export(int, 32, 256) var hint_radius = 128
export(int, 32, 256) var click_radius = 64
export(float, 0.5, 3.0, 0.1) var interact_time = 1.0
export(bool) var enabled = true setget set_enabled

onready var sprite = $Sprite
onready var hint_collision_shape_2d = $HintArea/CollisionShape2D
onready var click_collision_shape_2d = $ClickArea/CollisionShape2D
onready var click_area = $ClickArea
onready var animation_player = $AnimationPlayer
onready var progress_bar = $Control/ProgressBar

var interact_duration = 0.0
var interact_enabled = false
var interacting = false

func _ready():
	sprite.texture = sprite_texture
	hint_collision_shape_2d.shape.radius = hint_radius
	click_collision_shape_2d.shape.radius = click_radius

func _physics_process(delta):
	if not Engine.editor_hint:
		update_interact_duration(delta)
		update_progress_bar()
		update_completion()

func _input(event):
	if event.is_action_released("interact"):
		interacting = false

func _on_ClickArea_input_event(_viewport, event, _shape_idx):
	if interact_enabled and event.is_action_pressed("interact"):
		interacting = true

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
	if not Engine.editor_hint:
		click_area.monitoring = enabled

func set_sprite_texture(texture):
	sprite_texture = texture
	if not is_inside_tree():
		yield(self, "ready")
	update_sprite()

func update_sprite():
	if Engine.editor_hint:
		$Sprite.texture = sprite_texture
	else:
		sprite.texture = sprite_texture

func update_interact_duration(delta):
	if interact_enabled and interacting:
		interact_duration += delta
	else:
		interact_duration = 0

func update_progress_bar():
	if interact_duration > 0:
		progress_bar.visible = true
		progress_bar.value = interact_duration * 100.0 / interact_time
	else:
		progress_bar.visible = false

func update_completion():
	if interact_duration >= interact_time:
		finish_interactions()
		emit_interaction_complete()

func finish_interactions():
	click_area.monitoring = false
	interact_enabled = false
	progress_bar.visible = false

func emit_interaction_complete():
	emit_signal("interaction_complete")
