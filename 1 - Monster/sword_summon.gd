extends Position2D

var player = null
var fire_rate = 1.0
var fire_time = 0.0
var rang = 300

var bullet = preload("res://flying_sword.tscn")

func _physics_process(delta):
	if player == null:
		return
	var dir_to_p = player.global_position - global_position
	fire_time += delta
	if fire_time > fire_rate:
		fire_time = 0
	pass

func fire():
	if global_position.distance_to(player.global_position) > rang:
		return
	var bullet_inst = bullet.instance()
	get_tree().get_root().add_child(bullet_inst)
	bullet_inst.global_position = global_position
	var dir_to_p = (player.global_position - global_position).normalized()
	bullet_inst.move_dir = dir_to_p
	pass


func set_player(p):
	player = p