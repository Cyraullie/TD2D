extends Node2D

@onready var path = preload("res://Mobs/Stage1.tscn")


func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
	pass # Replace with function body.
