extends Control

@onready var score_label = $ScoreLabel
@onready var lifes_label =  $LifeLabel

func set_lifes(lifes: int) -> void:
	lifes_label.text = "Vidas: " + str(lifes)
	
func set_points(points: int) -> void:
	score_label.text = "Pontos: " + str(points)
