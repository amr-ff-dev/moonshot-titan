extends HBoxContainer

class_name QuestItem

var quest setget set_quest

onready var quest_name = $QuestName
onready var quest_complete = $QuestComplete

func set_quest(value):
	quest = value
	if not is_inside_tree():
		yield(self, "ready")
	display_quest()

func display_quest():
	quest_name.text = "{name} ...".format({name = quest.name})
	if quest.complete:
		quest_complete.text = "[y]"
	else:
		quest_name.set("custom_colors/font_color", Color.palegreen)
		quest_complete.text = "[ ]"
