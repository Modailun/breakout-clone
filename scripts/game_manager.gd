extends Node2D

# Liste des chemins vers tes scènes
const Scenes := {
	"MAIN_MENU" = "res://scenes/main_menu.tscn"
}

# Scène actuelle
var current_scene : Node = null

func _ready():
	# Charge la scène de départ (ex: menu principal)
	change_scene(Scenes["MAIN_MENU"])

# Fonction pour changer de scène
func change_scene(new_scene_path: String) -> void:
	# Supprime la scène actuelle si elle existe
	if current_scene:
		current_scene.queue_free()

	# Charge la nouvelle scène
	var new_scene = load(new_scene_path).instantiate()
	add_child(new_scene)
	current_scene = new_scene
