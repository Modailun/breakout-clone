extends Container


func _on_start_game_pressed() -> void:
	print("Start Game")
	ScenesManager.change_scene(ScenesManager.Scenes["LEVEL_1"])


func _on_exit_pressed() -> void:
	get_tree().quit()
