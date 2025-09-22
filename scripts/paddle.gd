extends CharacterBody2D

# Vitesse de déplacement du personnage (exportée pour être modifiable dans l'éditeur)
@export var speed: float = 400.0
@export var position_y: float = 1024.0

func _process(delta: float) -> void:
	if position.y != position_y:
		position.y = position_y	# Recentre le paddle en Y s'il a bougé

	# Récupère la direction de l'input :
	# - Renvoie -1 si "move_left" est pressé,
	# - Renvoie 1 si "move_right" est pressé,
	# - Renvoie 0 si aucune touche n'est pressée.
	var direction: float = Input.get_axis("move_left", "move_right")

	# Applique le mouvement horizontal
	if direction != 0:
	 # Si une touche est pressée, applique la vitesse dans la direction demandée
		velocity.x = direction * speed
	else:
		# Si aucune touche n'est pressée, ralentit progressivement le personnage
		# jusqu'à l'arrêt (décélération douce).
		# `move_toward` réduit `velocity.x` vers 0 à une vitesse maximale de 100 * `speed` par seconde.
		velocity.x = move_toward(velocity.x, 0.0, 100 * speed * delta)

	# Déplace le personnage en tenant compte des collisions
	# `move_and_slide()` gère automatiquement les collisions avec les murs et le sol.
	move_and_slide()