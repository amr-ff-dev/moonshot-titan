extends Node2D

signal suit_change(texture)

onready var spider_story_animation = $SpiderStoryQuestAnimation
onready var spider_interactable = $SpiderInteractable

func _on_SpiderInteractable_interaction_complete():
	spider_interactable.queue_free()
	spider_story_animation.play("play_spider_story")
	yield(spider_story_animation, "animation_finished")

func _on_SuitLocker_locker_interaction_complete(texture):
	emit_signal("suit_change", texture)
