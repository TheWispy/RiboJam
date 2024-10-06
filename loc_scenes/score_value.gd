extends Label

var game_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    self.text = str(int(game_score))
    pass


func _on_player_score(score):
    print("SCORE ADD")
    game_score += score
    self.text = str(game_score+int(score))
    pass # Replace with function body.
