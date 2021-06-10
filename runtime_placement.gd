extends Node3D

@onready var raycast := $RayCast3D as RayCast3D

var runtime_decal_scene := preload("res://runtime_decal.tscn")

func _input(event) -> void:
	if event is InputEventMouseMotion:
		var camera := get_viewport().get_camera()
		raycast.global_transform.origin = camera.global_transform.origin
		var target := camera.project_position(event.position, 1000)
		raycast.target_position = target
		
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var decal := runtime_decal_scene.instance()
		decal.modulate = Color(randf(), randf(), randf())
		decal.global_transform = Transform(-raycast.get_collision_normal(), raycast.get_collision_point())
		add_child(decal)
