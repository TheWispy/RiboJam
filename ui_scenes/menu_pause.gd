extends Control


var pause_time
# Called when the node enters the scene tree for the first time.
func _ready():
    hide()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if get_tree().paused == true:
        show()
        
    if Input.is_action_just_pressed("pause"):
        if (Time.get_ticks_msec() - pause_time) > 100:
            _on_resume_pressed()
    pass


func _on_resume_pressed():
    hide()
    get_tree().paused = false
    pass # Replace with function body.


func _on_player_paused():
    get_tree().paused = true
    pause_time = Time.get_ticks_msec()
    show()
    pass # Replace with function body.
