extends VehicleBody3D

var max_rpm = 1000
var max_torque = 400

func _physics_process(delta):
	set_steering (lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta))
	var acceleration = Input.get_axis("back", "forward")
	var rpm = abs($back_left_wheel.get_rpm())
	rpm = abs($back_right_wheel.get_rpm())
	set_engine_force (acceleration * max_torque * ( 1 - rpm / max_rpm))
