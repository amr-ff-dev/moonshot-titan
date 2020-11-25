extends Node2D

class_name Titan

enum CollisionLayers {
	WALL = 1,
	PLAYER = 2,
	ENEMY = 4,
	PROJECTILE = 8,
	HAZARD = 16,
	PLAYER_HAZARD = 32,
	OBSTACLE = 64,
	DETECT = 128,
	GRAV = 256,
}

var QuestRoom = preload("res://levels/quest_room/quest_room.gd")
var RocketPad = preload("res://levels/rocket_pad/rocket_pad.gd")

onready var player = $Player
onready var restart_button = $HUD/Restart
onready var player_respawn = $CrewQuarters/PlayerRespawn
onready var quest_tracker = $HUD/QuestTracker

var quest_list = []
var final_quest

func _ready():
	for child in get_children():
		if child is QuestRoom:
			quest_list.push_back(child.get_quest())
			child.connect("player_entered", self, "_on_QuestRoom_player_entered")
			child.connect("quest_active", self, "_on_QuestRoom_quest_active")
			child.connect("quest_complete", self, "_on_QuestRoom_quest_complete")
		if child is RocketPad:
			final_quest = child.get_quest()
	update_quest_tracker()

func _input(event):
	if event.is_action_pressed("full_screen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _on_Player_shoot(projectile, origin, direction):
	add_child(projectile)
	projectile.launch(origin, direction)

func _on_Player_game_over():
	restart_button.visible = true

func _on_HUD_restart():
	player.respawn(player_respawn)
	restart_button.visible = false

func _on_QuestRoom_player_entered(spawn_point):
	update_player_resapwn(spawn_point)

func _on_QuestRoom_quest_active(quest):
	quest.active = true
	update_quest_tracker()

func _on_QuestRoom_quest_complete(quest):
	quest.complete = true
	update_quest_tracker()

func update_quest_tracker():
	quest_tracker.update_quest_tracker(quest_list)

func update_player_resapwn(spawn_point):
	player_respawn = spawn_point
