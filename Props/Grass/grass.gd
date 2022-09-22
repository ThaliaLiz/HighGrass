extends Area2D

func _ready():
	set_process(false)
	
func _on_Grass_body_entered(body):
	$GrassFullHeight.visible = false
	$GrassGrowing.frame = 0
	$GrassGrowing.visible = true

func _on_Grass_body_exited(body):
	$GrassGrowing.play("growing")
	set_process(true)
	
func _process(delta):
	if $GrassGrowing.frame != 7:
		return 
	$GrassFullHeight.visible = true
	$GrassGrowing.visible = false
	$GrassGrowing.stop()
	set_process(false)
