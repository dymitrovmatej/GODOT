extends Node2D

func _on_Area2D_area_entered(area):
	area.queue_free()
	$AudioStreamPlayer.play()
	$Obalka/Sprite.visible = false
	$AnimationPlayer.stop()
	$Obalka/Particles2D.emitting = true
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
