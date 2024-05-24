extends Panel

@onready var tower = preload("res://Towers/GreenBulletTower.tscn")
var currTile


func _on_gui_input(event):
	if Game.Gold >= 10:
		var tempTower = tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
			#left click down
			add_child(tempTower)
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			
			#reduce size of placeable tower
			##tempTower.scale = Vector2(0.32, 0.32)
		elif event is InputEventMouseMotion and event.button_mask == 1:
			#left click down & drag
			if get_child_count() > 1:
				get_child(1).global_position = event.global_position
				
				var mapPath = get_tree().get_root().get_node("Main/TileMap")
				var tile = mapPath.local_to_map(get_global_mouse_position())
				currTile = mapPath.get_cell_atlas_coords(0, tile, false)
				
				var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
				
				
				if currTile == Vector2i(4,5):
					if targets.size() > 0:
						get_child(1).get_node("Area").modulate = Color(255,0,0)
					else:
						get_child(1).get_node("Area").modulate = Color(0,255,0)
				else:
					get_child(1).get_node("Area").modulate = Color(255,0,0)
					
		elif event is InputEventMouseButton and event.button_mask == 0:
			#left click up
			#to not place tower under pannel => if event.global_position.x >= 1000:
			if get_child_count() > 1:
				get_child(1).queue_free()
			
			if currTile == Vector2i(4,5):
				var path = get_tree().get_root().get_node("Main/Towers")
				var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies()
				
				if targets.size() < 1:
					path.add_child(tempTower)
					tempTower.global_position = event.global_position
					tempTower.get_node("Area").hide()
					Game.Gold -= 25
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
