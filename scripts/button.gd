extends Node3D

@export var connectedRoom: Node3D
@onready var timer: Timer = $Timer

func on_enter(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if !timer.is_stopped() == true:
		return
	connectedRoom.turn()
	$AnimationPlayer.play("toggle")
	timer.start(1)
