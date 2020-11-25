extends Resource

class_name Quest

var name := ""
var active := false
var complete := false

func _init(quest_name, quest_active, quest_complete):
	name = quest_name
	active = quest_active
	complete = quest_complete
