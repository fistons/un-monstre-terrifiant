extends CanvasLayer


func update(coins: int, hearts: int, max_hearts: int):
	$Control/VBoxContainer/CoinBar/CoinGauge/CoinCount.text = str(coins)
	print(str(hearts) + "   " + str(max_hearts))

	$Control/VBoxContainer/HeartBar.update_stuff(hearts, max_hearts)
