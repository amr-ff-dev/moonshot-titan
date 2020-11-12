extends Resource

class_name Quest

var name := ""
var complete := false

func _init(quest_name, quest_complete):
	name = quest_name
	complete = quest_complete
