extends Node

var toppings = {
	"boba": 0,
	"coconut_jelly": 0,
}

func add_topping(item_name, amount):
	toppings[item_name] += amount

func use_topping(item_name):
	if toppings[item_name] > 0:
		toppings[item_name] -= 1
		return true
	return false
