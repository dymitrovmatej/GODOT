extends Area2D

export var rychlost = 800

func _ready():
	if rychlost < 0:
		$Sprite.flip_v = true
		$CollisionShape2D.position.x = -27.5

func _physics_process(delta):
	position.x += rychlost*delta

func _on_Timer_timeout():
	queue_free()
