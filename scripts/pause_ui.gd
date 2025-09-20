extends CanvasLayer


func _on_texture_button_pressed() -> void:
	print("Main Menu")
	GameManager.change_scene(GameManager.Scenes["MAIN_MENU"])
