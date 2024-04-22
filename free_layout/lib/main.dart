import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIODATA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemrograman Berbasis Mobile'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return WideLayout();
            } else {
              return NarrowLayout();
            }
          },
        ),
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mode Mobile',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 20),
          Container(
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(20),
              child: Image.asset('images/urban1.jpg')),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Dibuat untuk melengkapi tugas mata kuliah PBM\nLayout ini berisi mendeskripsikan diri saya sendiri',
              style: TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when Contact button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
                child: Text('Contact'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action when Favorite button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                },
                child: Text('Hobby'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action when About Us button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
                child: Text('About me'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mode Windows',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Image.asset('images/urban1.jpg')),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Dibuat untuk melengkapi tugas mata kuliah PBM\nLayout ini berisi mendeskripsikan diri saya sendiri.',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Action when Contact button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                    child: Text('Kontak'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action when Favorite button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritePage()),
                      );
                    },
                    child: Text('Favorite'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action when About Us button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsPage()),
                      );
                    },
                    child: Text('Tentang Saya'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _launchWhatsApp(); // Action when WhatsApp button is pressed
              },
              icon: Image.asset(
                'images/whatsapp.png',
                width: 24,
                height: 24,
              ),
              label: Text('WhatsApp'),
            ),
            SizedBox(width: 30),
            ElevatedButton.icon(
              onPressed: () {
                _launchInstagram(); // Action when Instagram button is pressed
              },
              icon: Image.asset(
                'images/instagram.png',
                width: 24,
                height: 24,
              ),
              label: Text('Instagram'),
            ),
            SizedBox(width: 30),
            ElevatedButton.icon(
              onPressed: () {
                _launchPinterest(); // Action when Pinterest button is pressed
              },
              icon: Image.asset(
                'images/pinterest.png',
                width: 24,
                height: 24,
              ),
              label: Text('Pinterest'),
            ),
          ],
        ),
      ),
    );
  }
}

_launchWhatsApp() async {
  String phoneNumber = '+6285810565054'; // Nomor Anda
  String message = 'Halo, saya ingin menghubungi Anda.';
  String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka $url';
  }
}

_launchInstagram() async {
  String username = 'farsyaasfian'; // Instagram Anda

  String url = 'https://www.instagram.com/$username';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka $url';
  }
}

_launchPinterest() async {
  String username = 'username'; // Pinterest Anda
  String url = 'https://www.pinterest.com/';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka $url';
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hobi sehari-hari'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          FavoriteItem(
            title: 'Ngopi/Ngeteh',
            imageUrl: ('images/coffee.png'),
            onTap: () {
              // Action when Coffee Mug is tapped
            },
          ),
          SizedBox(height: 16.5),
          FavoriteItem(
            title: 'Main Game',
            imageUrl: 'images/console.png',
            onTap: () {
              // Action when Notebook is tapped
            },
          ),
          SizedBox(height: 16.5),
          FavoriteItem(
            title: 'Dengerin Musik',
            imageUrl: 'images/music.png',
            onTap: () {
              // Action when Headphones is tapped
            },
          ),
          SizedBox(height: 16.5),
          // Add more FavoriteItems here
        ],
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const FavoriteItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 180.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Saya'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/man.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Farsya Asfian Saputra',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Mahasiswa Teknik Informatika\nUniversitas Pancasila Jakarta',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Kontak:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: farsyaasfian18@gmail.com\nTelepon: 0858-1056-5054',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Alamat:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _launchMaps(); // Action when Address is tapped
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'RT.5/RW.2, Gambir, Kecamatan Gambir.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Indonesia',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchMaps() async {
  const url =
      'https://www.google.com/maps/place/Monumen+Nasional/@-6.1890259,106.8155751,14.5z/data=!4m6!3m5!1s0x2e69f5d2e764b12d:0x3d2ad6e1e0e9bcc8!8m2!3d-6.1753924!4d106.8271528!16zL20vMDNxN2hz?entry=ttu';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka $url';
  }
}
