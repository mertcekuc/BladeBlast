extends Node

var game_paused = false
var player_location : Vector2

var money = 0
var experience = 0
var level = 0

var phealthcap = 100
var phealth = phealthcap
var pspeed = 250
var prange = 100
var items = []
var pknockback = 10
var player_class = "Fighter"
var survivaltime = ""

var goblin_killed = 0
