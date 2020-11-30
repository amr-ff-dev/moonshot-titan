extends KinematicBody2D

signal request_open_door()

class_name Engineer

onready var completion_animation = $EngineerAnimation
onready var quest_bubble = $QuestBubble
onready var quest_text = $QuestBubble/QuestText

var at_rocket = false
var hint_quest

func rescued():
	completion_animation.play("display_quest_text")
	yield(completion_animation, "animation_finished")
	completion_animation.play("run_to_rocket")
	yield(completion_animation, "animation_finished")
	enable_hint_quest()

func enable_hint_quest():
	at_rocket = true
	update_hint_quest_display()

func update_hint_quest(quest):
	hint_quest = quest
	update_hint_quest_display()

func update_hint_quest_display():
	if at_rocket and hint_quest:
		quest_bubble.visible = true
		quest_text.text = "Please %s" % [hint_quest.name]
	elif at_rocket:
		quest_bubble.visible = false

func open_door():
	emit_signal("request_open_door")
