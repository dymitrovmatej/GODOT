extends Area2D


export var level: PackedScene
func _on_Area2D_body_entered(body):
	get_tree().change_scene_to(level)
