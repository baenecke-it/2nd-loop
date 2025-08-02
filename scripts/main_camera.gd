extends Camera3D
var input = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadMotion:
		input = Input.get_vector("camera_right", "camera_left", "camera_down", "camera_up")

func _physics_process(delta: float) -> void:
	rotation.y += input.x * delta
	rotation.x += input.y * delta
