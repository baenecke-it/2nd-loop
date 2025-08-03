extends Node3D
var inside = false
@onready var camera: Camera3D = $SubViewport/Camera3D

var open = false
func turn(amount: int = 90) -> void:
	rotation_degrees.y += amount
	rotate_around(camera, amount)
	if inside:
		rotate_around(%Character, amount)
	if fmod(rotation_degrees.y, 180.0) == 0:
		if fmod(rotation_degrees.y, 360.0) == 0:
			return
		open = true
		$Door/door/AnimationPlayer.play("open")
	else:
		if open:
			$Door/door/AnimationPlayer.play("close")
		open = false

func toggle_inside(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("char"):
		inside = !inside

func rotate_around(node3d: Node3D, amount: float = 90, center: Vector3 = Vector3.ZERO) -> void:
	node3d.position = center + node3d.position.rotated(Vector3.UP, deg_to_rad(amount))
	node3d.rotation_degrees.y += amount
