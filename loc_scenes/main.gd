extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_song_ribo_game():
    $Outro/RichTextLabel2.text = "Your score: "+$ScoreValue.text
    $Outro.visible = true
    pass # Replace with function body.
