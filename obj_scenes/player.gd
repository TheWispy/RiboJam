class_name Player extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal paused


func _physics_process(delta):
    if Input.is_action_just_pressed("pause"):
        emit_signal("paused")
    pass
