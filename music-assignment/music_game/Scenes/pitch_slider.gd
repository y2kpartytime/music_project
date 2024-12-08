extends HSlider

@onready var pitch_slider: HSlider = $"."

@onready var click_audio: AudioStreamPlayer = $"../click_audio"

func _ready():
	pitch_slider.value_changed.connect(_on_slider_value_changed)

func _on_slider_value_changed(value: float) -> void:
	click_audio.pitch_scale = value
