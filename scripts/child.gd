extends Area2D

@export var gift_node: NodePath
var gifted: bool = false

func _on_body_entered(_body):
	if gifted:
		return

	gifted = true

	var gift = get_node(gift_node)
	if gift:
		gift.visible = true
