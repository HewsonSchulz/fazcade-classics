extends Area2D


var waiting: bool = false
@onready var gifts = $"../Items/Gifts"
@onready var child = $"../Children/Child"
@onready var child2 = $"../Children/Child2"
@onready var child3 = $"../Children/Child3"
@onready var child4 = $"../Children/Child4"
@onready var title = $"../Title"

func _on_body_entered(_body):
	if not waiting:
		return
	
	waiting = false
	
	# remove gifts
	gifts.visible = false
	
	# reset children
	child.gifted = false
	child2.gifted = false
	child3.gifted = false
	child4.gifted = false
	
	# switch title
	title.frame = 1
	title.offset.y = -3
