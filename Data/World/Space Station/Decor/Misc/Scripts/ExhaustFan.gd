extends AnimatedSprite

var timer = null

func _ready():
	randomize()
	timer = Timer.new()
	timer.wait_time = rand_range(0.1, 1)
	timer.connect("timeout", self, "on_timer_timeout")
	add_child(timer)	
	timer.start()
	
func on_timer_timeout():
	playing = true
	speed_scale = rand_range(2, 2.5)
	timer.stop()
