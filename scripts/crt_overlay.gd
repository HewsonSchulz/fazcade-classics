extends Node2D


@onready var black_bars = $BlackBars
@onready var white_lines = $WhiteLines
@onready var white_lines2 = $WhiteLines2
@onready var Static = $Static

func _ready():
	randomize()
	_start_loop(white_lines)
	_start_loop(white_lines2)
	_start_static_loop()

func _start_loop(sprite: AnimatedSprite2D) -> void:
	# allows for asynchronous execution
	call_deferred("_loop_frame", sprite)
func _start_static_loop() -> void:
	call_deferred("_loop_static")

func _loop_frame(sprite: AnimatedSprite2D) -> void:
	while true:
		var wait_time = randf_range(0.2, 0.6)
		await get_tree().create_timer(wait_time).timeout
		
		# random frame
		#sprite.frame = randi() % 5  # 0-4

		# random y position
		var pos = sprite.position
		pos.y = randf_range(-700.0, 700.0)
		sprite.position = pos
		# random opacity
		var alpha = randf_range(-20.0, 50.0) / 255.0
		sprite.modulate = Color(1, 1, 1, alpha)

func _loop_static() -> void:
	while true:
		var wait_time = randf_range(0.1, 0.3)
		await get_tree().create_timer(wait_time).timeout
		
		# random frame
		Static.frame = randi() % 6 # 0–5
		# random opacity
		var alpha: float
		if randf() < 0.1:
			alpha = 20.0
		else:
			alpha = 0.0
		Static.modulate = Color(1, 1, 1, (alpha / 255))
