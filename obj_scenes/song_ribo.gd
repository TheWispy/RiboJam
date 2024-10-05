extends Node2D

var is_starting = true

var music = preload("res://audio/MysteryFungeon.ogg")
var beat_length
var bar_length
var counter = 0
var audio_counter = 0
var delay = 0.0
var position_seconds = 0

var start_time

var base_scene = preload("res://obj_scenes/base.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
    var stream = music
    $AudioStreamPlayer.stream = stream
    print(stream.beat_count)
    print(stream.bpm)
    print(stream.bar_beats)
    print(stream.get_length())
    
    bar_length = (stream.bar_beats*60) / (stream.bpm)
    beat_length = (stream.bar_beats*60) / (stream.bpm*4)
    pass # Replace with function body.

func spawn_base(number):
    var base = base_scene.instantiate()
    add_child(base)
    base.init(number)
    pass
    
var song_sheet = \
    [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [0,0,1,0],
        [1,0,1,0],
        [0,0,2,0],
        [2,0,0,0],
        [1,0,0,0],
        [0,0,0,2],
        [0,2,0,0],
        [0,2,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [0,0,1,0],
        [1,0,1,0],
        [0,0,2,0],
        [2,0,0,0],
        [1,0,0,0],
        [0,0,0,2],
        [0,2,0,0],
        [0,2,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [0,0,1,0],
        [1,0,1,0],
        [0,0,2,0],
        [2,0,0,0],
        [1,0,0,0],
        [0,0,0,2],
        [0,2,0,0],
        [0,2,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [1,0,1,0],
        [1,0,0,0],
        [0,0,1,0],
        [1,0,1,0],
        [0,0,2,0],
        [2,0,0,0],
        [1,0,0,0],
        [0,0,0,2],
        [0,2,0,0],
        [0,2,0,0],
        [0,0,0,0],
        [1,0,0,0],
        [1,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
    ]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var DELAY_BEATS = 7
    var START_DELAY = beat_length*DELAY_BEATS
    
    if is_starting:
        is_starting=false
        start_time = Time.get_ticks_msec()
        print("Start time", start_time)
        await get_tree().create_timer(beat_length*DELAY_BEATS, false).timeout
        print("Timer done.")
        $AudioStreamPlayer.play()
    else:
        if not $AudioStreamPlayer.playing:
            position_seconds = (Time.get_ticks_msec() - start_time) / 1000.0
        else:
            position_seconds = $AudioStreamPlayer.get_playback_position() + START_DELAY
        if (position_seconds > ((audio_counter+1) * beat_length) + (delay*0.3)):
            
            audio_counter += 1
            delay = (audio_counter)*beat_length - position_seconds
            print(audio_counter)
            print("AUDIO BEAT DELAY: ", (audio_counter)*beat_length - position_seconds)
            if not $AudioStreamPlayer.playing:
                print("Pause BEAT")
            if audio_counter >= DELAY_BEATS:
                print(song_sheet[audio_counter-DELAY_BEATS])
            for i in range(1, 5):
                await get_tree().create_timer(beat_length/4, false).timeout
                print(song_sheet[audio_counter])
                for j in range(1, 5):
                    var amount = song_sheet[audio_counter][j-1]
                    if amount == 1 and i == 1:
                        spawn_base(j)
                    if amount == 2 and i in [1,3]:
                        spawn_base(j)
                    if amount == 3 and i in [1,2,3]:
                        spawn_base(j)
                    if amount == 4 and i in [1,2,3,4]:
                        spawn_base(j)
            
            #spawn_base(randi_range(1,4))
    
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
