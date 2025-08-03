extends Node3D
var inside = false

func _input(event: InputEvent) -> void:
	if event.is_pressed() and event is InputEventKey and event.keycode == KEY_ENTER:
		rotation_degrees.y += 90
		if inside:
			%Character.position = Vector3.ZERO + %Character.position.rotated(Vector3.UP, PI/2)
			%Character.rotation_degrees.y += 90

func toggle_inside(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("char"):
		inside = !inside
