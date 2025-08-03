extends Node3D

@export var connectedRoom: Node3D
var state = false
@onready var timer: Timer = $Timer

func on_enter(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if !timer.is_stopped() == true:
		return
	match state:
		false:
			connectedRoom.turn()
			$AnimationPlayer.play("toggle-on")
		true:
			connectedRoom.turn(-90)
			$AnimationPlayer.play("toggle-off")
	state = !state
	timer.start(1)
