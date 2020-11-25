tool
extends Node2D

class_name QuestRoom

signal player_entered(spawn_point)
signal quest_active(quest)
signal quest_complete(quest)

export(Color, RGBA) var start_light_color = Color( 1, 0.196078, 0.196078, 1 )
export(Vector2) var light_position = Vector2(320, 384)
export(float, 1.0, 3.0, 0.1) var light_scale = 1.8

onready var light_texture = preload("res://effects/light.png")
onready var light = Light2D.new()

var Quest = preload("res://levels/quest_room/quest.gd")
var quest = null

func _init(quest_name):
	quest = Quest.new(quest_name, false, false)

func _ready():
	light.color = start_light_color
	light.position = light_position
	light.texture_scale = light_scale
	light.texture = light_texture
	add_child(light)

func get_quest():
	return quest

func emit_player_entered(spawn_point):
	emit_signal("player_entered", spawn_point)

func emit_quest_active():
	emit_signal("quest_active", quest)

func emit_quest_complete():
	emit_signal("quest_complete", quest)
