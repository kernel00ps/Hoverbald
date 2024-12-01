extends Node

var CHEAT_INVINCIBLE: bool = false

const CAMERA_MOTION_BASE_SPEED: float = 100

const MAX_FUEL = 100
const PICK_UP_ENERGY_VALUE: float = 10
const DEPLETION_RATE = -2
const PICKUP_VALUE = 10

const OBSTACLE_DELAY: int = 100
const OBSTACLE_RANGE: int = 200

const MAX_HP = 6

var camera_speed_modifier: float = 1
var current_fuel: float = 100
var fuel_modifier: float = DEPLETION_RATE # for depleting fuel and refueling
var current_hp: int = MAX_HP

signal damage_taken

var is_sound_on: bool = true
var is_shonja: bool = false
var is_crt_on: bool = true
