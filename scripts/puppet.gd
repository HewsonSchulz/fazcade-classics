extends CharacterBody2D


@export_range(0.0, 1.0, 0.05) var speed: float = 0.85
const STEP_SIZE: int = 16
var move_timer := 0.0
var ready_to_move := true


func _ready():
	global_position = global_position.snapped(Vector2(STEP_SIZE, STEP_SIZE))
	print("move_delay: ", get_move_delay())

func get_move_delay() -> float:
	return 1.0 - speed

func _physics_process(delta):
	# Countdown between held moves
	if not ready_to_move:
		move_timer -= delta
		if move_timer <= 0:
			ready_to_move = true

	if ready_to_move:
		var input_vector := Vector2.ZERO

		if Input.is_action_pressed("right"):
			input_vector.x += 1
		elif Input.is_action_pressed("left"):
			input_vector.x -= 1
		elif Input.is_action_pressed("down"):
			input_vector.y += 1
		elif Input.is_action_pressed("up"):
			input_vector.y -= 1

		if input_vector != Vector2.ZERO:
			global_position += input_vector.normalized().snapped(Vector2.ONE) * STEP_SIZE
			move_timer = get_move_delay()
		
			ready_to_move = false
