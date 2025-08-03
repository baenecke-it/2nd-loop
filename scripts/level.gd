extends Node3D

@export var startPoint: Vector3
@export_range(2, 10, 1) var size: float = 2
@export var levelFile: String = ""  # Path to the level data file

const room_size: float = 10.0  # Size of each room

var roomType: Dictionary = {
	1: '1',
	2: 'I',
	3: 'L',
	4: 'T',
	5: '+',
}

#func _ready() -> void:
#	var level: Array = []
#	# If levelData is provided, load it
#	if levelFile != "":
#		var levelData: String = FileAccess.get_file_as_string(levelFile)
#		print("Level data from file: ", levelData)
#		if levelData != "":
#			print("Loading level data from file: ", levelFile)
#			level = JSON.parse_string(levelData)
#			for room in level :
#				room["position"] = Vector3(room["position"][0], room["position"][1], room["position"][2])
#			
#			print("Loaded level data: ", level)
#		else:
#			print("No level data found in file: ", levelFile)
#	else:
#		# Generate the level based on the start point and size
#		if size < 2:
#			print("Size must be at least 2. Setting to default size of 2.")
#			size = 2
#			
#		# Generate the level
#		level = generate_level(size)
#		print("Generated level data: ", level)
#	
#	# Add rooms based on the generated level data
#	for i in range(size):
#		for j in range(size):
#			# Map level data to room instantiation
#			var room_data: Dictionary = level[i * int(size) + j]
#			var room_scene: String = "res://scenes/rooms/room" + room_data["type"] + ".tscn"
#			var room_instance: Node3D = load(room_scene).instantiate()
#			room_instance.position = startPoint + room_data["position"]
#			room_instance.rotation_degrees.y = room_data["rotation"]
#			add_child(room_instance)

func generate_level(size: float) -> Array:
	var level: Array = []
	for i in range(int(size)):
		for j in range(int(size)):
			var room_position: Vector3 = startPoint + Vector3(i * room_size, 0, j * room_size)
			var room_type: int = randi() % 4 + 1  # Randomly choose a room type
			var rotation: float = randi() % 4 * 90  # Random rotation in multiples of 90 degrees
			var room: Dictionary = {
				"position": room_position,
				"type": roomType[room_type],
				"rotation": rotation
			}
			level.append(room)
	return level
