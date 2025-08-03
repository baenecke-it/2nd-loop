extends Node3D

@export var rooms: Array[Node3D]
static var tvIndex: int = 0

@onready var TVs: Array[Node] = $TVs.get_children()

func add_room(room: Node3D) -> void:
	if tvIndex >= TVs.size():
		print("rooms ", rooms)
		print("All TVs are filled.")
		return
	rooms.append(room)
	print("Room added to control room: ", room.name, " at position ", room.position, " with index ", tvIndex)
	var TV: MeshInstance3D = TVs[tvIndex]
	var mat := TV.mesh.surface_get_material(4)
	var newTexture: ViewportTexture = rooms[tvIndex].get_node('SubViewport').get_texture()
	mat.set("albedo_texture", newTexture)
	tvIndex += 1
