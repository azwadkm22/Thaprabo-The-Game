extends CanvasLayer


var coins = 0;

func _ready():
	$Coins.text = String(coins)
	pass

func _process(delta):
	$Coins.text = String(coins)
