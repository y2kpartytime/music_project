extends HSlider

@export 
var bus_name: String
var bus_index: int
var pitch_scale

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)


func _on_value_changed(value: float) -> void:
	"pitch_scale".()
