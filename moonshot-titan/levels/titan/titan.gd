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
}

var QuestRoom = preload("res://levels/quest_room/quest_room.gd")

onready var player = $Player
onready var restart_button = $HUD/Restart
onready var player_respawn = $CrewQuarters/PlayerRespawn

func _ready():
	for child in get_children():
		if child is QuestRoom:
			child.connect("player_entered", self, "_on_QuestRoom_player_entered")

func _on_Player_shoot(projectile, origin, direction):
	add_child(projectile)
	projectile.launch(origin, direction)

func _on_Player_game_over():
	restart_button.visible = true

func _on_Restart_pressed():
	player.respawn(player_respawn)
	restart_button.visible = false

func _on_QuestRoom_player_entered(_quest, spawn_point):
	player_respawn = spawn_point
