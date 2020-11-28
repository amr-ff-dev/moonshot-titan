tool
extends Node2D

class_name QuestRoom

signal player_entered(spawn_point)
signal quest_active(quest)
signal quest_complete(quest)
signal suit_change(texture)

export(Color, RGBA) var start_light_color = Color(1, 0.196078, 0.196078, 1)
export(Color, RGBA) var finish_light_color = Color(0.8, 0.8, 0.8, 0.8)
export(Vector2) var light_position = Vector2(320, 384)
export(float, 1.0, 3.0, 0.1) var light_scale = 1.8

onready var light_texture = preload("res://effects/light.png")
onready var light = Light2D.new()

var Quest = preload("res://levels/quest_room/quest.gd")
var Spider = preload("res://characters/enemies/spider/spider.gd")
var SuitLocker = preload("res://models/interactable/suit_locker.gd")

var quest = null
var live_spiders = 0

func _init(quest_name):
	quest = Quest.new(quest_name, false, false)

func _ready():
	add_light()
	track_spiders()
	connect_suit_lockers()

func _on_Spider_track_dead():
	live_spiders -= 1
	if live_spiders <= 0:
		finish_room()

func _on_SuitLocker_interaction_complete(texture):
	emit_suit_change(texture)

func add_light():
	light.color = start_light_color
	light.position = light_position
	light.texture_scale = light_scale
	light.texture = light_texture
	add_child(light)

func track_spiders():
	for child in get_children():
		if child is Spider:
			live_spiders += 1
			child.connect("dead", self, "_on_Spider_track_dead")

func connect_suit_lockers():
	for child in get_children():
		if child is SuitLocker:
			child.connect("locker_interaction_complete", self, "_on_SuitLocker_interaction_complete")

func get_quest():
	return quest

func finish_room():
	light.color = finish_light_color

func emit_player_entered(spawn_point):
	emit_signal("player_entered", spawn_point)

func emit_quest_active():
	emit_signal("quest_active", quest)

func emit_quest_complete():
	emit_signal("quest_complete", quest)

func emit_suit_change(texture):
	emit_signal("suit_change", texture)
