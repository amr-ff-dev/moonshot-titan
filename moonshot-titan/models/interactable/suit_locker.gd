tool
extends StaticBody2D

signal locker_interaction_complete(texture)

export(Texture) var suit_texture
export(Texture) var locker_texture

onready var suit_interactable = $SuitInteractable

func _ready():
	suit_interactable.suit_texture = suit_texture
	suit_interactable.sprite_texture = locker_texture

func _on_SuitInteractable_suit_interaction_complete(texture):
	emit_signal("locker_interaction_complete", texture)
