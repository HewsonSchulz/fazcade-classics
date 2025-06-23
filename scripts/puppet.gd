extends CharacterBody2D

@export_range(0.0, 1.0, 0.05) var speed: float = 0.85
const STEP_SIZE: int = 16
var move_timer := 0.0
var ready_to_move := true

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	global_position = global_position.snapped(Vector2(STEP_SIZE, STEP_SIZE))

func get_move_delay() -> float:
	return 1.0 - speed

func _physics_process(delta):
	if not ready_to_move:
		move_timer -= delta
		if move_timer <= 0:
			ready_to_move = true

	if ready_to_move:
		var input_vector := Vector2(
			int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left")),
			int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
		)

		if input_vector != Vector2.ZERO:
			input_vector = input_vector.normalized().snapped(Vector2.ONE)

			var full_motion = input_vector * STEP_SIZE
			var horizontal_motion = Vector2(input_vector.x, 0) * STEP_SIZE
			var vertical_motion = Vector2(0, input_vector.y) * STEP_SIZE

			var moved = false

			if move_and_collide(full_motion) == null:
				moved = true
			elif input_vector.x != 0 and move_and_collide(horizontal_motion) == null:
				moved = true
			elif input_vector.y != 0 and move_and_collide(vertical_motion) == null:
				moved = true

			if moved:
				move_timer = get_move_delay()
				ready_to_move = false

				# face current direction
				if input_vector.x > 0:
					sprite.frame = 0
				elif input_vector.x < 0:
					sprite.frame = 1
