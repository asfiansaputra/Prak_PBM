import 'food_menu.dart';
import 'cart_items.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 8 | Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selamat Datang di Praktikum 8 Flutter!'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
              child: const Text('Menu'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(18)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<FoodMenu> foodMenus = [
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1714611446679-6059b55d824e?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Pasta',
      price: 55000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1680674814945-7945d913319c?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Nasi Goreng',
      price: 35000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1666239308345-c4c12ef3e177?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Ayam Goreng',
      price: 40000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1588791174744-7e9bf4378277?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Lobster',
      price: 25000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1563245370-63ffc97abdbd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Dimsum',
      price: 40000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1652752731860-ef0cf518f13a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Takoyaki',
      price: 25000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1565182363525-f95648bbeee0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Croissant',
      price: 20000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Burger',
      price: 35000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1687426163461-1eeb49c83584?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Bakso Urat',
      price: 20000,
    ),
    FoodMenu(
      imageUrl:
          'https://images.unsplash.com/photo-1603736029103-dafad0eb0906?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Ice Cream',
      price: 22000,
    ),
  ];

  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.blue, // Ubah warna background AppBar di sini
        titleTextStyle: const TextStyle(
          color: Colors.white, // Ubah warna teks AppBar di sini
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ubah warna ikon AppBar di sini
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: foodMenus.length,
          itemBuilder: (context, index) {
            final foodMenu = foodMenus[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMenuPage(foodMenu: foodMenu),
                  ),
                );
                setState(() {
                  cart.addItem(foodMenu);
                });
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        foodMenu.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodMenu.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rp ${foodMenu.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailMenuPage extends StatelessWidget {
  final FoodMenu foodMenu;

  const DetailMenuPage({Key? key, required this.foodMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                foodMenu.imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                foodMenu.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Rp ${foodMenu.price}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          return ListTile(
            title: Text(cartItem.foodMenu.name),
            leading: Image.network(
              cartItem.foodMenu.imageUrl,
              width: 50, // Atur lebar gambar sesuai kebutuhan Anda
              height: 50, // Atur tinggi gambar sesuai kebutuhan Anda
              fit: BoxFit
                  .cover, // Sesuaikan penyesuaian gambar sesuai kebutuhan Anda
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rp ${cartItem.foodMenu.price} x ${cartItem.quantity}'),
                Text('Total: Rp ${cartItem.totalPrice}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    cartItem.decrementQuantity(); // Reduce item quantity
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${cartItem.foodMenu.name} removed from cart'),
                      ),
                    );
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    cartItem.incrementQuantity(); // Increase item quantity
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${cartItem.foodMenu.name} added to cart'),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: Rp ${cart.calculateTotalPrice()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic for payment process here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Payment Confirmation'),
                        content:
                            Text('Total: Rp ${cart.calculateTotalPrice()}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add logic to complete the payment here
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Payment successful!'),
                                ),
                              );
                            },
                            child: Text('Confirm'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String restaurantExteriorUrl =
      'https://images.unsplash.com/photo-1584466712601-a0d1c1684754?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  final String restaurantInteriorUrl =
      'https://images.unsplash.com/photo-1557955776-857434f1c951?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  final String restaurantName = 'Moneta Restaurant';
  final String restaurantLocation = 'Jl. Jend. Sudirman No. 1';
  final String mapsUrl =
      'https://www.google.com/maps/search/?api=1&query=-6.200000,106.816666&basemap=satellite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Foto Luar Restoran:'),
              const SizedBox(height: 8),
              Image.network(restaurantExteriorUrl),
              const SizedBox(height: 16),
              const Text('Foto Dalam Restoran:'),
              const SizedBox(height: 8),
              Image.network(restaurantInteriorUrl),
              const SizedBox(height: 16),
              const Text('Lokasi:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(restaurantLocation),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () async {
                  Uri mapsUri = Uri.parse(mapsUrl);
                  if (await canLaunchUrl(mapsUri)) {
                    await launchUrl(mapsUri);
                  } else {
                    throw 'Could not launch $mapsUrl';
                  }
                },
                icon: const Icon(Icons.map),
                label: const Text('Buka di Google Maps'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
