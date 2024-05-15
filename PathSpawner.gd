extends Node2D

@onready var path = preload("res://Mobs/Stage1.tscn")
var gameStarter = false

func _on_timer_timeout():
	if gameStarter:
		var tempPath = path.instantiate()
		add_child(tempPath)

#TODO add wave system
func _on_start_pressed():
	gameStarter = true
	get_parent().get_node("Start").hide()
	pass # Replace with function body.
