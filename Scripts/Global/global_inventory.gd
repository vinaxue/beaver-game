extends Node

var inventory = {
	Constants.TOPPINGS: {
		Constants.BOBA: 0,
		Constants.COCONUT_JELLY: 0,
	}, 
	Constants.FRIDGE: {
		Constants.MILK: 0,
		Constants.ICE: 1
	}
}

func add_item(item_group, item_name, amount):
	inventory[item_group][item_name] += amount

func use_item(item_group, item_name):
	if item_name == Constants.ICE:
		return true
		
	if inventory[item_group][item_name] > 0:
		inventory[item_group][item_name] -= 1
		return true
	return false
