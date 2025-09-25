extends MarginContainer

@onready var score_lose_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/ScoreLoseLabel

func _ready() -> void:
	score_lose_label.text = "Your Score: " + str(ScenesManager.latest_score)

func _on_button_pressed() -> void:
	ScenesManager.change_scene(ScenesManager.Scenes["LEVEL_1"])
