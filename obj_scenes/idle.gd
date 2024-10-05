extends PlayerState


func enter(_msg := {}) -> void:
    #if _msg.get("land"):
        #player.sounds["land"].play()
    player.velocity = Vector2.ZERO
    #player.sprite.play("idle")

func physics_update(delta: float) -> void:
    
    
    #if not player.is_on_floor():
        #state_machine.transition_to("Air")
#
    #if Input.is_action_just_pressed("jump"):
        #state_machine.transition_to("Air", {do_jump = true})
    #elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
        #state_machine.transition_to("Run")
        #
    #if Input.is_action_just_pressed("interact"):
        #state_machine.transition_to("Attack")
    #
    #
    #
    #if player.direction_y > 0.1 and player.is_on_floor() and player.sprite.animation != "idle_crouch":
        #state_machine.transition_to("Crouch")
        #
        #
    #
        #
    #player.velocity.y += player.gravity * delta
    #player.move_and_slide()
    
    
    
    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    #var direction = Input.get_axis("input_left", "input_right")
    #if direction:
        #player.velocity.x = direction * player.SPEED
    #else:
        #player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
#
    #player.move_and_slide()
    pass


# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
    pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
    pass


# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
    pass
