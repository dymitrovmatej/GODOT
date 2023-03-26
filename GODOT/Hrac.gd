extends KinematicBody2D

export var rychlost = 300
export var gravitace = 2000
export var skok = -1000

var pohyb = Vector2()
var smer = 1

var scenastr = preload("res://Strela.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("konec"):
		get_tree().quit()
	pohyb.y += gravitace*delta
	if is_on_floor():
		if Input.is_action_pressed("vlevo"):
			pohyb.x = -rychlost
			$Animak.flip_h = true
			$Animak.play("Run")
			smer = -1
		elif Input.is_action_pressed("vpravo"):
			pohyb.x = rychlost
			$Animak.flip_h = false
			$Animak.play("Run")
			smer = 1
		else:
			pohyb.x = 0
			$Animak.play("Idle")
		if Input.is_action_pressed("skok"):
			pohyb.y = skok
			$Animak.play("Jump")
			$Vyskok.play()
	else:
		if pohyb.y > 0:
			$Animak.play("Fall")
	if Input.is_action_just_pressed("strelba"):
		var vystrel = scenastr.instance()
		if smer > 0:
			vystrel.position = $Vystrelp.global_position
		elif smer < 0:
			vystrel.position = $Vystrell.global_position
		vystrel.rychlost *= smer
		$"../Strely".add_child(vystrel)
	pohyb = move_and_slide(pohyb, Vector2(0,-1))
