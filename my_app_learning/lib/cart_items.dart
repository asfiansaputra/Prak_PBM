import 'food_menu.dart';

// Kelas untuk mengelola keranjang belanja
// Kelas untuk mengelola keranjang belanja
class Cart {
  List<CartItem> _items = [];

  // Mendapatkan daftar item pada keranjang belanja
  List<CartItem> get items => _items;

  // Menambahkan item ke dalam keranjang belanja
  void addItem(FoodMenu item) {
    // Cek apakah item sudah ada di keranjang
    bool found = false;
    for (var cartItem in _items) {
      if (cartItem.foodMenu == item) {
        cartItem.incrementQuantity();
        found = true;
        break;
      }
    }

    // Jika tidak ada, tambahkan item baru ke dalam keranjang
    if (!found) {
      _items.add(CartItem(foodMenu: item));
    }
  }

  // Menghapus item dari keranjang belanja
  void removeItem(CartItem item) {
    _items.remove(item);
  }

  // Menghitung total harga pesanan
  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in _items) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }
}

// Kelas untuk menyimpan detail item dalam keranjang
class CartItem {
  final FoodMenu foodMenu;
  int quantity;

  CartItem({required this.foodMenu, this.quantity = 1});

  // Menambah jumlah item
  void incrementQuantity() {
    quantity++;
  }

  // Mengurangi jumlah item
  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  // Menghitung total harga untuk item ini
  int get totalPrice => foodMenu.price * quantity;
}
