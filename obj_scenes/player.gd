class_name Player extends CharacterBody2D

signal paused
signal score(value: int)

const LINE_POS = 119

var lookup = {
    "1": ["red", 80],
    "2": ["blue", 140],
    "3": ["green", 200],
    "4": ["yellow", 260]
}

func do_hit(number):
    var B = number
    var space_state = get_world_2d().direct_space_state
    var position = self.position
    # use global coordinates, not local to node
    var query = PhysicsRayQueryParameters2D.create(Vector2(0, lookup[B][1]), Vector2(640, lookup[B][1]))
    var result = space_state.intersect_ray(query)
    if result == {}:
        print("NULL")
        return null
    else:
        print(result)
        var score = max(100/(abs(result.position.x - LINE_POS)+1), 0)
        result["collider"].get_parent().queue_free()
        return score

func _physics_process(delta):
    if Input.is_action_just_pressed("pause"):
        emit_signal("paused")
    var score    
    if Input.is_action_just_pressed("base1"):
        score = do_hit("1")
    if Input.is_action_just_pressed("base2"):
        score = do_hit("2")
    if Input.is_action_just_pressed("base3"):
        score = do_hit("3")
    if Input.is_action_just_pressed("base4"):
        score = do_hit("4")
    if score != null:
        emit_signal("score", score)
    pass
