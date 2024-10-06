extends ProgressBar

var prog = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    self.value = prog
    pass


func _on_song_ribo_beat(number, progress):
    print("PROG UPDATE", progress)
    prog = progress*100
    pass # Replace with function body.
