extends Node

# Score actuel du joueur
var score: int = 0
# Nombre de vies restantes
var lives: int = 3
# Compteur de bricks cassées (pour le multiplicateur)
var count: int = 0
# Compteur de bricks cassées depuis le début de la partie
var bricks: int = 0
# Multiplicateur de score (augmente toutes les 5 briques détruites)
var mul: int = 1
# Références aux labels pour afficher le score et les vies
@onready var score_label: Label = $ScoreLabel
@onready var lives_label: Label = $LivesLabel

# Ajoute des points au score
func add_point(points: int) -> void:
	#print("Adding points: ", points)  # Affiche les points ajoutés dans la console
	count += 1  # Incrémente le compteur de briques détruites
	bricks += 1  # Incrémente le compteur total de briques détruites

	# Toutes les 5 briques détruites, augmente le multiplicateur de score
	if count % 5 == 1 and count > 1:
		mul += 1

    # Ajoute les points au score, en tenant compte du multiplicateur
	score += mul * points
    # Met à jour l'affichage du score
	score_label.text = "Score: " + str(score)

	#print("Current count: ", count)  # Affiche le compteur actuel dans la console
	#print("Current bricks: ", bricks)  # Affiche le compteur de bricks actuel dans la console
	# Si toutes les briques sont détruites (84), le joueur gagne
	if bricks >= 84:
		game_over(true)

# Retire une vie au joueur
func lose_life() -> void:
	#print("Losing a life")  # Affiche la perte de vie dans la console
	score -= 50  # Pénalité de 50 points pour la perte d'une vie

	if lives > 1:
		lives -= 1  # Retire une vie
		mul = 1  # Réinitialise le multiplicateur
		count = 0  # Réinitialise le compteur de briques
		# Met à jour l'affichage du score et des vies
		score_label.text = "Score: " + str(score)
		lives_label.text = "Lives: " + str(lives)
	else:
		# Si c'était la dernière vie, le joueur perd
		game_over(false)

# Gère la fin de partie (victoire ou défaite)
func game_over(win: bool) -> void:
	# Enregistre le dernier score dans le gestionnaire de scènes
	ScenesManager.latest_score = score

	# Réinitialise les variables pour une nouvelle partie
	score = 0
	lives = 3
	mul = 1
	count = 0

	if not win:
		#print("Game Over")  # Affiche "Game Over" dans la console
		# Charge l'écran de fin de partie (défaite)
		ScenesManager.change_scene(ScenesManager.Scenes["END_SCREEN_LOSE"])
	else:
		#print("You Win!")  # Affiche "You Win!" dans la console
		# Charge l'écran de fin de partie (victoire)
		ScenesManager.change_scene(ScenesManager.Scenes["END_SCREEN_WIN"])