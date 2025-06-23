extends Node

@onready var num1 = $AnimatedSprite1
@onready var num10 = $AnimatedSprite10
@onready var num100 = $AnimatedSprite100
@onready var num1000 = $AnimatedSprite1000
var score: int = 0

func increment(inc = 100):
	score += inc
	score = clamp(score, 0, 9999) # max score of 9999
	refresh_display()

func refresh_display():
	var score_str := str(score).pad_zeros(4)
	display(num1000, score_str[0])
	display(num100,  score_str[1])
	display(num10,   score_str[2])
	display(num1,    score_str[3])

func display(sprite: AnimatedSprite2D, chr: String):
	var char_to_frame = {
		'0': 0,
		'1': 1,
		'2': 2,
		'3': 3,
		'4': 4,
		'5': 5,
		'6': 6,
		'7': 7,
		'8': 8,
		'9': 9,
		'+': 10,
		'-': 11,
		'.': 12,
		'e': 13,
	}
	if chr in char_to_frame:
		sprite.frame = char_to_frame[chr]
	else:
		sprite.frame = 11 # default to dash
