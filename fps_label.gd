extends Label


func _physics_process(delta):
	text = "%d FPS" % Engine.get_frames_per_second()
