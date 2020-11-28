tool
extends Interactable

signal suit_interaction_complete(texture)

export(Texture) var suit_texture

func finish_interactions():
	progress_bar.visible = false

func emit_interaction_complete():
	emit_signal("suit_interaction_complete", suit_texture)
