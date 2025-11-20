extends Node 

const CHARACTER_START_POS := Vector2i(45, 300)

func _ready():
	$Stump.body_entered.connect(on_body_entered)
	$Portal.body_entered.connect(next_scene)
	$game_over.get_node("Button").pressed.connect(new_game)
	new_game()

func new_game():
	get_tree().paused = false
	$Character.position = CHARACTER_START_POS
	$game_over.hide()

func on_body_entered(body):
	if body.name == "Character":
		game_over()

func game_over():
	get_tree().paused = true 
	$game_over.show()

func next_scene(body):
	if body.name == "Character":
		get_tree().change_scene_to_file("res://scenes/world2.tscn")
