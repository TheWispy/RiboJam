extends Node2D

var is_waiting = true

var music = preload("res://audio/MysteryFungeon.ogg")
var beat_length
var bar_length
var counter = 0
var audio_counter = 0
var delay = 0.0

var base = preload("res://obj_scenes/base.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
    var stream = music
    $AudioStreamPlayer.stream = stream
    print(stream.beat_count)
    print(stream.bpm)
    print(stream.bar_beats)
    print(stream.get_length())
    $AudioStreamPlayer.play()
    bar_length = (stream.bar_beats*60) / (stream.bpm)
    beat_length = (stream.bar_beats*60) / (stream.bpm*4)
    pass # Replace with function body.

func spawn_base(number):
    base.instantiate()
    base.init(number)
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var position_seconds = $AudioStreamPlayer.get_playback_position()
    if not is_waiting:
        return
    if (position_seconds > ((audio_counter+1) * beat_length) + (delay*0.3)):
        audio_counter += 1
        delay = (audio_counter)*beat_length - position_seconds
        print(audio_counter)
        print("AUDIO BEAT DELAY: ", (audio_counter)*beat_length - position_seconds)
    #else:
        #is_waiting=false
        #counter += 1
        #await get_tree().create_timer(beat_length).timeout # waits for 1 second
        #print("Ping!", counter)
        #
       #
        #print("OLD COUNTER DELAY:", counter*beat_length - position_seconds)
        #var beat
        #var calculated_beat
        #is_waiting=true
    pass
