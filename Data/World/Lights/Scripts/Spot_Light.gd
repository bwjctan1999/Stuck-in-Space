extends Light2D

onready var area = $Area2D

func _ready():
	area.connect("body_entered", self, "body_entered")
	area.connect("body_exited", self, "body_exited")
	
func body_entered(body):
	range_item_cull_mask += 2
	
func body_exited(body):
	range_item_cull_mask -= 2


