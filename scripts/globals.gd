extends Node

const CAMERA_MOTION_BASE_SPEED: float = 100
const MAX_FUEL = 100
const PICK_UP_ENERGY_VALUE: float = 10
const DEPLETION_RATE = -2
const PICKUP_VALUE = 10
var camera_speed_modifier: float = 1
var current_fuel: float = 100
var fuel_modifier: float = DEPLETION_RATE # for depleting fuel and refueling
