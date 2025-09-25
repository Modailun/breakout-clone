extends MarginContainer

@onready var score_lose_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/ScoreLoseLabel

func _ready() -> void:
    score_lose_label.text = "Your Score: " + str(ScenesManager.latest_score)