// Inventory item struct
function InventoryItem(_key, _quantity=1) constructor {
	self.key = _key;
	self.quantity = _quantity;
}

// Inventory struct with methods for adding and reducing quantity of items
function Inventory() constructor {
	self.items = [];
	self.add_item = function(_item) {
		var _idx = array_find_index(self.items, method({key: _item.key}, function(_elem) {
			return _elem.key == key;
		}));
		if (_idx != -1) {
			self.items[_idx].quantity++;
		}
		else {
			array_push(self.items, _item);
		}
	}
	self.reduce_quantity = function(_item_key, _num=1) {
		var _idx = array_find_index(self.items, method({key: _item_key}, function(_elem) {
			return _elem.key == key;
		}));
		if (_idx != -1) {
			self.items[_idx].quantity -= _num;
			if (self.items[_idx].quantity <= 0) array_delete(self.items, _idx, 1);
		}
	}
}

// Initialize player's inventory and gold
self.inventory = new Inventory();
self.gold = 0;

