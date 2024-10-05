extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_back_pressed():
    get_tree().change_scene_to_file("res://ui_scenes/menu_main.tscn")
    pass # Replace with function body.


func _on_sfx_value_changed(value):
    $CenterContainer/VBoxContainer/HBoxContainer/Value.text = str(int(value))+"%"
    idx = AudioServer.get_bus_index("SFX")
    AudioServer.set_bus_volume_db(value*80 - 80)
    pass # Replace with function body.


func _on_music_value_changed(value):
    $CenterContainer/VBoxContainer/HBoxContainer2/Value.text = str(int(value))+"%"
    idx = AudioServer.get_bus_index("Music")
    AudioServer.set_bus_volume_db(value*80 - 80)
    pass # Replace with function body.
