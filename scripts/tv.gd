extends MeshInstance3D

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		%MainCamera.rotation = Vector3.ZERO

func on_click(camera:Node, event:InputEvent, event_position:Vector3, normal:Vector3, shape_idx:int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		%MainCamera.look_at(global_position)
