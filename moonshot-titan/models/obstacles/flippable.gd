tool
extends StaticBody2D

export(bool) var flip_horizontal = false setget set_flip_horizontal
export(bool) var flip_vertical = false setget set_flip_vertical

func set_flip_horizontal(flip):
	flip_horizontal = flip
	$Sprite.flip_h = flip

func set_flip_vertical(flip):
	flip_vertical = flip
	$Sprite.flip_v = flip
