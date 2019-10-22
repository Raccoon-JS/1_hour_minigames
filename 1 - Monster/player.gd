extends KinematicBody2D

const SPEED = 150
var movedir = Vector2(0,0)
var dead = false

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if dead:
		get_tree().reload_current_scene()
	pass

func _physics_process(_delta):
	controls_loop()
	movement_loop()
	pass

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left") 
	var RIGHT = Input.is_action_pressed("ui_right") 
	var UP = Input.is_action_pressed("ui_up") 
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
	if movedir.x > 0:
		$Sprite.flip_h = true
	elif movedir.x < 0:
		$Sprite.flip_h = false
	
	pass

func movement_loop():
	var motion = movedir.normalized() * SPEED
	motion = move_and_slide(motion, Vector2(0,0))
	pass

func die():
	dead = true
	