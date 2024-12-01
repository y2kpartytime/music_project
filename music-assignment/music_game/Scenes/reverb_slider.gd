extends HSlider

@onready var reverb_slider: HSlider = $"."

@onready var click_audio: AudioStreamPlayer = $"../click_audio"
@onready var reverb_bus = AudioServer.get_bus_index("ReverbBus")


func _ready():
	set_reverb_amount(value)

func set_reverb_amount(value: float):
	var reverb_effect = AudioServer.get_bus_effect_instance(reverb_bus, 0)
	if reverb_effect:
		reverb_effect.amount = value
		return

func _on_value_changed(value: float) -> void:
	set_reverb_amount(value)
