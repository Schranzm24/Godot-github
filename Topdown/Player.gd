extends CharacterBody2D
var x=0
var y=0
var isDead=false
var rot = 0

var right
var left
var up
var down
var acc = Vector2()

func _physics_process(delta):
	if isDead:
		return
	var has_input=false
	#if abs(position.x-x)+abs(position.y-y)>32:
		#pass
		

	if Input.is_action_pressed("ui_right"): 
		right = 16
		$AnimatedSprite2D.animation="Right"
		$AnimatedSprite2D.play()
	else:
		right = 0
	if Input.is_action_pressed("ui_left"):
		left = 16
		$AnimatedSprite2D.animation="Left"
		$AnimatedSprite2D.play()
	else:
		left = 0
	if Input.is_action_pressed("ui_down"):
		down = 16
		$AnimatedSprite2D.animation="Down"
		$AnimatedSprite2D.play()
	else:
		down = 0
	if Input.is_action_pressed("ui_up"):
		up = 16
		$AnimatedSprite2D.animation="Up"
		$AnimatedSprite2D.play()
	else:
		up = 0

	acc.x = right - left
	acc.y = down - up
	velocity += acc
	velocity*= 0.9
	
	#
	#if Input.is_action_just_pressed("ui_left"):
		
		##velocity.x = -32
		#has_input=true
		#rot=180
	#elif Input.is_action_just_pressed("ui_right"):
		
		##velocity.x = 32
		#has_input=true
		#rot=0
	#elif Input.is_action_just_pressed("ui_down"):
		
		##velocity.y = 32
		#has_input=true
		#rot=90
	#elif Input.is_action_just_pressed("ui_up"):
		
		##velocity.y = -32
		#has_input=true
		#rot=270
	#if has_input:
		#var tween=create_tween().set_parallel(true)
		#tween.tween_property(self,"position:x",x,.3).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		#tween.tween_property(self,"position:y",y,.3).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		#tween.tween_property(self,"rotation",rotation+2*PI,.5)
	
		
		#twe.tween_property($Sprite, "modulate", Color.RED, 1)
		#
	move_and_slide()
