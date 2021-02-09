extends Node2D

func _ready():
	#Sets physics fps to screen refreshrate, (Fixes Screen Jitter)
	Engine.set_target_fps(Engine.get_iterations_per_second())
	
