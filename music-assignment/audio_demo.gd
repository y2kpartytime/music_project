extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	if $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.stop()
		$".".text = "Play"
	else:
		$AudioStreamPlayer2D.play()
		$".".text = "Stop"



func _on_bus_filter_value_changed(value: float) -> void:
	var f:AudioEffectPhaser = AudioServer.get_bus_effect()
	f.rate_hz = value


func _on_pitch_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer2D.pitch_scale = value
