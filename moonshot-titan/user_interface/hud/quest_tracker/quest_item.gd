extends HBoxContainer

class_name QuestItem

var quest setget set_quest

onready var quest_name = $QuestName

func set_quest(value):
	quest = value
	if not is_inside_tree():
		yield(self, "ready")
	display_quest()

func display_quest():
	quest_name.text = quest.name
	if quest.active:
		show()
	else:
		hide()
	if quest.complete:
		quest_name.add_color_override("font_color", Color.palegreen)
