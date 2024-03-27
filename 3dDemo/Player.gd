extends CharacterBody3D
@onready var ray_cast_3d = $RayCast3D
@onready var animated_sprite_2d = $CanvasLayer/gunBase/AnimatedSprite2D
@onready var shoot_sound = $ShootSound
@onready var death_sound = $PlayerDeathSound
const SPEED = 5.0
const MOUSE_SENS = 0.5

var can_shoot = true
var dead = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	animated_sprite_2d.animation_finished.connect(shoot_anim_done)
	$CanvasLayer/deathScreen/Button.button_up.connect(restart)

func _input(event):
	if dead:
		return
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * MOUSE_SENS
		print(dead)
		 

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		restart()
		
	if dead:
		return
	if Input.is_action_just_pressed("shoot"):
		shoot()


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
		
	
func shoot():
	if !can_shoot:
		return
	if can_shoot:
		animated_sprite_2d.play("shoot")
		shoot_sound.play()
		can_shoot = false
		if ray_cast_3d.is_colliding() and ray_cast_3d.get_collider().has_method("kill"):
			ray_cast_3d.get_collider().kill()
func shoot_anim_done():
	can_shoot = true

	
func restart():
	get_tree().reload_current_scene()
	
func kill():
	$CanvasLayer/deathScreen.show()
	if !dead:
		death_sound.play()
	dead = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
