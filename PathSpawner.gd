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
			if Game.Health > 0:
				get_parent().get_node("Start").show()

func _on_start_pressed():
	Game.gameStarter = true
	get_parent().get_node("Start").hide()

func _on_restart_pressed():
	Game.gameStarter = false
	get_parent().get_node("Start").show()
	get_parent().get_node("UI").show()
	get_parent().get_node("Restart").hide()
	get_parent().get_node("GameOver").hide()
	Game.Health = 10
	Game.Gold = 100
	ennemyNumber = 10
	currEnnemyNumber = 0
	if get_parent().get_node("Towers").get_child_count() != 0:
		for child in get_parent().get_node("Towers").get_children():
			child.queue_free()
		
		
	if get_parent().get_node("PathSpawner").get_child_count() != 1:
		for child in get_parent().get_node("PathSpawner").get_children():
			if child.name != "Timer":
				child.queue_free()
	pass # Replace with function body.
