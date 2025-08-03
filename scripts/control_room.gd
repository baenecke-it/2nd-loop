extends Node3D

@export var rooms: Array[Node3D]

func _ready() -> void:
	for TVindex in len($TVs.get_children()):
		if TVindex == 2:
			return
		var TV: MeshInstance3D = $TVs.get_child(TVindex)
		var mat := TV.mesh.surface_get_material(4)
		var newTexture: ViewportTexture = rooms[TVindex].get_node('SubViewport').get_texture()
		mat.set("albedo_texture", newTexture)
