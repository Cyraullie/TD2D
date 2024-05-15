extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Shop").hide()

func _on_shop_button_pressed():
	get_node("Shop").show()
	get_node("ShopButton").hide()
	pass # Replace with function body.


func _on_close_shop_pressed():
	get_node("Shop").hide()
	get_node("ShopButton").show()
	pass # Replace with function body.
