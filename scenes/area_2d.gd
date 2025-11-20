extends Area2D

func _ready():
	$44.body_entered.connect(on_body_entered)


func on_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://scene/level_2.tscn")
