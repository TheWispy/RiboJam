class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal paused


func _physics_process(delta):
    if Input.is_action_just_pressed("pause"):
        emit_signal("paused")
        
    if Input.is_action_just_pressed("base1"):
        var space_state = get_world_2d().direct_space_state
        # use global coordinates, not local to node
        var query = PhysicsRayQueryParameters2D.create(Vector2(0, 0), Vector2(50, 100))
        var result = space_state.intersect_ray(query)
        pass
    if Input.is_action_just_pressed("base2"):
        pass
    if Input.is_action_just_pressed("base3"):
        pass
    if Input.is_action_just_pressed("base4"):
        pass
    pass
