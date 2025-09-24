extends Node

var score : int = 0
var lives : int = 3
var count: int = 0
var mul: int = 1

@onready var score_label: Label = $ScoreLabel
@onready var lives_label: Label = $LivesLabel

func add_point(points: int) -> void:
	print("Adding points: ", points)
	count += 1
	if count % 5 == 0:
		mul += 1
	score += mul * points
	score_label.text = "Score: " + str(score)

func lose_life() -> void:
	print("Losing a life")
	lives -= 1
	score -= 50
	mul = 1
	count = 0
	score_label.text = "Score: " + str(score)
	lives_label.text = "Lives: " + str(lives)