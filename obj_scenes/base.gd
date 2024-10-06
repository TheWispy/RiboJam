extends Node2D

@export var SPEED = 120.0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

var lookup = {
    "1": ["red", 80],
    "2": ["blue", 140],
    "3": ["green", 200],
    "4": ["yellow", 260]
}


func init(number):
    var n : String = str(number)
    self.position.x = 600
    self.position.y = lookup[n][1]
    $AnimatedSprite2D.animation = lookup[n][0]
    pass
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    self.position.x -= (SPEED * delta)
    if self.position.x < 0:
        queue_free()
    pass
