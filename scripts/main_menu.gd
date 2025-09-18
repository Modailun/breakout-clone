extends MarginContainer


func _on_start_game_pressed() -> void:
	print("Start Game")
	GameManager.change_scene(GameManager.Scenes["LEVEL_1"])
