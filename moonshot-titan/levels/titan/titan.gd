extends GameScene

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
var Spider = load("res://characters/enemies/spider/spider.gd")

onready var player = $Player
onready var restart_button = $HUD/Restart
onready var player_respawn = $CrewQuarters/PlayerRespawn
onready var quest_tracker = $HUD/QuestTracker
onready var engineer = $MedicalBay/Engineer

var quest_list = []
var final_quest
var spider_list = []

func _ready():
	for child in get_children():
		if child is QuestRoom:
			init_room(child)
		if child is RocketPad:
			final_quest = child.get_quest()
	update_quest_tracker()

func _on_Player_shoot(projectile, origin, direction):
	add_child(projectile)
	projectile.launch(origin, direction)

func _on_Player_damaged():
	stop_interactions()

func _on_Player_game_over():
	restart_button.visible = true
	reset_spiders()

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

func on_QuestRoom_suit_change(texture):
	change_player_suit(texture)

func _on_RocketPad_game_finished():
	change_scene("OutroCredits")

func _on_ResearchLab_suit_change(texture):
	change_player_suit(texture)

func change_player_suit(texture):
	player.change_suit(texture)

func final_quest_should_be_active():
	for quest in quest_list:
		if quest != final_quest and !quest.complete:
			return false
	return true

func update_quest_tracker():
	if final_quest_should_be_active():
		final_quest.active = true
	quest_tracker.update_quest_tracker(quest_list)
	update_engineer_hint()

func update_player_resapwn(spawn_point):
	player_respawn = spawn_point

func init_room(room):
	init_room_quest(room)
	init_room_spiders(room)

func init_room_quest(room):
	quest_list.push_back(room.get_quest())
	room.connect("player_entered", self, "_on_QuestRoom_player_entered")
	room.connect("quest_active", self, "_on_QuestRoom_quest_active")
	room.connect("quest_complete", self, "_on_QuestRoom_quest_complete")
	room.connect("suit_change", self, "on_QuestRoom_suit_change")

func init_room_spiders(room):
	for child in room.get_children():
		if child is Spider:
			spider_list.push_back(child)

func reset_spiders():
	for spider in spider_list:
		spider.reset()

func stop_interactions():
	var event = InputEventAction.new()
	event.action = "interact"
	event.pressed = false
	Input.parse_input_event(event)

func update_engineer_hint():
	var hint_quest = get_active_quest()
	if !hint_quest:
		hint_quest = get_unfinished_quest()
	engineer.update_hint_quest(hint_quest)

func get_active_quest():
	var active_quest = null
	for quest in quest_list:
		if !quest.active:
			active_quest = quest
	return active_quest

func get_unfinished_quest():
	var unfinished_quest = null
	for quest in quest_list:
		if !quest.complete:
			unfinished_quest = quest
	return unfinished_quest
