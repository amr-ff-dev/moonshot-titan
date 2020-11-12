extends MarginContainer

class_name QuestTracker

var QuestItem = preload("res://user_interface/hud/quest_tracker/quest_item.tscn")

onready var quest_item_list = $QuestItemList

func update_quest_tracker(quest_list):
	for quest in quest_list:
		add_or_update(quest)

func add_or_update(quest):
	var quest_item = get_quest_item(quest)
	if quest_item:
		quest_item.quest = quest
	else:
		quest_item = QuestItem.instance()
		quest_item.quest = quest
		quest_item_list.add_child(quest_item)

func get_quest_item(quest):
	for quest_item in quest_item_list.get_children():
		if quest_item.quest == quest:
			return quest_item
	return null
