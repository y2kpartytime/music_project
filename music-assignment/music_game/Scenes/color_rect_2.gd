extends ColorRect

var effect
var volume


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	effect = AudioServer.get_bus_effect_instance(3, 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	volume = effect.get_magnitude_for_frequency_range(100, 1000).length()
	$".".color = color.srgb_to_linear(volume) *90
