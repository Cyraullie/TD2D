extends Node2D

@onready var path = preload("res://Mobs/Stage1.tscn")
var ennemyNumber = 10
var currEnnemyNumber = 0

func _on_timer_timeout():
	if Game.gameStarter:
		if currEnnemyNumber < ennemyNumber:
			currEnnemyNumber += 1
			var tempPath = path.instantiate()
			add_child(tempPath)
		
		var EnnemyAlive = get_tree().get_root().get_node("Main/PathSpawner").get_child_count()-1
		
		if EnnemyAlive == 0:
			currEnnemyNumber = 0
			ennemyNumber += 10
			Game.gameStarter = false
			get_parent().get_node("Start").show()
		


func _on_start_pressed():
	Game.gameStarter = true
	get_parent().get_node("Start").hide()
	pass # Replace with function body.
