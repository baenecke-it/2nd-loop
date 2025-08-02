extends Node3D

func _input(event: InputEvent) -> void:
	if event.is_pressed() and event is InputEventKey and event.keycode == KEY_ENTER:
		rotation_degrees.y += 90
