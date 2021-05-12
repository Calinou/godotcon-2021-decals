extends Decal

var caustic_id := 0
var timer := 0.0

func _physics_process(delta):
	timer += delta
	if timer >= 0.04:  # 25 FPS
		timer = 0.0
		caustic_id = (caustic_id + 1) % 32
		texture_emission = load("res://decals/caustics/caust%02d.png" % caustic_id)
