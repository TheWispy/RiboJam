extends AnimatedSprite2D

var is_waiting = true
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func do_roll():
    var roll = randi_range(1,10)
    if roll < 4:
        self.transform.x = self.transform.x * -1
    if roll == 10:
        self.animation = "snooze"
    else:
        self.animation = "idle"
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if not is_waiting:
        pass
    else:
        is_waiting=false
        await get_tree().create_timer(0.5+randi_range(0,3)).timeout
        do_roll()
        is_waiting=true
    pass
