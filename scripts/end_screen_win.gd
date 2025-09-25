extends MarginContainer

@onready var score_win_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/ScoreWinLabel

func _ready() -> void:
	score_win_label.text = "Your Score: " + str(ScenesManager.latest_score)

func _on_button_pressed() -> void:
	ScenesManager.change_scene(ScenesManager.Scenes["LEVEL_1"])
