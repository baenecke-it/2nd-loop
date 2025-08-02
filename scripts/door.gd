extends Node3D
@export var i: int = 0

func toggle() -> void:
	var player: AnimationPlayer = $AnimationPlayer
	match i:
		0:
			player.play("open")
			i = 1
			return
		1:
			player.play("close")
			i = 0
			return
