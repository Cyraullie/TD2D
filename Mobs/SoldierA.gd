extends CharacterBody2D

#will be speed in px per second
@export var speed = 500
var health = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		Game.Health -= 1
		death()
	
	if health <= 0:
		Game.Gold += 1
		death()
	

func death():
	get_parent().get_parent().queue_free()
