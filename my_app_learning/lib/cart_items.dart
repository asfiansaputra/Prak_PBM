import 'food_menu.dart';

class Cart {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addItem(FoodMenu item) {
    bool found = false;
    for (var cartItem in _items) {
      if (cartItem.foodMenu == item) {
        cartItem.incrementQuantity();
        found = true;
        break;
      }
    }
    if (!found) {
      _items.add(CartItem(foodMenu: item));
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in _items) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }
}

class CartItem {
  final FoodMenu foodMenu;
  int quantity;

  CartItem({required this.foodMenu, this.quantity = 1});

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  int get totalPrice => foodMenu.price * quantity;
}
