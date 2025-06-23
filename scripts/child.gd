extends Area2D

@export var gift_node: NodePath
@export var mask_node: NodePath
var gifted: bool = false
@onready var score = %Score
@onready var crying_child = %CryingChild

func _on_body_entered(_body):
	if gifted:
		return

	gifted = true
	var gift = get_node(gift_node)
	var mask = get_node(mask_node)

	if not score.score > 300:
		if gift:
			gift.visible = true
	else:
		if mask:
			mask.visible = true
	score.increment()
	
	# activate next phase trigger if all gifts are given
	if score.score == 400:
		crying_child.waiting = true
