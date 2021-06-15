extends Decal


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	# Remove the node once it's no longer visible avoid cluttering the scene tree,
	# which can have a negative performance impact.
	queue_free()
