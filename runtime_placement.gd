extends Node3D

@onready var raycast := $RayCast3D as RayCast3D

var runtime_decal_scene := preload("res://runtime_decal.tscn")

func _input(event) -> void:
	if event is InputEventMouseMotion:
		var camera := get_viewport().get_camera_3d()
		raycast.global_transform.origin = camera.global_transform.origin
		var target := camera.project_position(event.position, 1000)
		raycast.target_position = target

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var decal := runtime_decal_scene.instantiate()
		# Override colors for all keys (initial fade-in, max opacity, end of fade-out).
		# The Animation resource is marked as Local To Scene to avoid affecting other instances.
		var color := Color(randf(), randf(), randf())
		decal.get_node("AnimationPlayer").get_animation("fade").track_set_key_value(0, 0, color * Color(1, 1, 1, 0))
		decal.get_node("AnimationPlayer").get_animation("fade").track_set_key_value(0, 1, color)
		decal.get_node("AnimationPlayer").get_animation("fade").track_set_key_value(0, 2, color * Color(1, 1, 1, 0))
		decal.global_transform = Transform3D(Basis.from_euler(-raycast.get_collision_normal()), raycast.get_collision_point())
		decal.rotation.y = randf_range(0, TAU)
		decal.extents.x *= randf_range(0.9, 1.1)
		decal.extents.z *= randf_range(0.9, 1.1)
		add_child(decal)
