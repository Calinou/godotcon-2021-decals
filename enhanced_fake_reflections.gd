extends Node3D

@onready var source_rigid := $Top/RigidBody3D/MeshInstance3D as Node3D

# Negative scale is applied on the child MeshInstance3D since it will be flipped again.
@onready var mirror_rigid := $Bottom/Mirror as Node3D


func _physics_process(delta: float) -> void:
	mirror_rigid.global_transform = source_rigid.global_transform.scaled(Vector3(1, -1, 1))
