tool
extends Node2D

class_name QuestRoom

signal player_entered(quest, spawn_point)
signal quest_complete(quest)

export(Color, RGBA) var default_light_color = Color( 1, 0.196078, 0.196078, 1 )

onready var light = Light2D.new()

func _ready():
	light.position = Vector2(320, 384)
	light.texture = load("res://effects/light.png")
	light.texture_scale = 1.8
	light.color = default_light_color
	add_child(light)

func emit_player_entered(quest, spawn_point):
	emit_signal("player_entered", quest, spawn_point)

func emit_quest_complete(quest):
	emit_signal("quest_complete", quest)
