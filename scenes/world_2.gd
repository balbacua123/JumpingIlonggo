extends Node 

const CHARACTER_START_POS := Vector2i(45, 300)

func _ready():
	$Kalaban.body_entered.connect(on_body_entered)
	$Bird.body_entered.connect(on_body_entered)
	$Portal.body_entered.connect(grats)
	new_game()
	
func new_game():
	get_tree().paused = false
	$Character.position = CHARACTER_START_POS
	$GameOver.hide()
	$congrats.hide()

func on_body_entered(body):
	if body.name == "Character":
		game_over()
		get_tree().change_scene_to_file("res://scenes/world2.tscn")

func game_over():
	get_tree().paused = true 
	$GameOver.show()

func grats(body):
	if body.name == "Character":
		_congrats()

func _congrats():
	get_tree().paused = true
	$congrats.show()
