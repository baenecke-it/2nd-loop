extends Node3D

@export var cameras: Array[SubViewport]

func _ready() -> void:
	print(cameras)
	for TVindex in len($TVs.get_children()):
		var TV: MeshInstance3D = $TVs.get_child(TVindex)
		var mat := TV.mesh.surface_get_material(4)
		var newTexture: ViewportTexture = cameras[TVindex].get_texture()
		mat.set("albedo_texture", newTexture)
