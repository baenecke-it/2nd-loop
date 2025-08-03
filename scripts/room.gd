extends Node3D
var inside = false
@onready var camera: Camera3D = $SubViewport/Camera3D

func _input(event: InputEvent) -> void:
	if event.is_pressed() and event is InputEventKey and event.keycode == KEY_ENTER:
		rotation_degrees.y += 90
		rotate_around(camera)
		if inside:
			rotate_around(%Character)

func toggle_inside(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("char"):
		inside = !inside

func rotate_around(node3d: Node3D, center: Vector3 = Vector3.ZERO) -> void:
	node3d.position = center + node3d.position.rotated(Vector3.UP, PI/2)
	node3d.rotation_degrees.y += 90