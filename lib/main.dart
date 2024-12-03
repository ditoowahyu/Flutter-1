import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Untuk membuka URL

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text(
                'Dito Wahyu Pratama',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              accountEmail: Text(
                'ditoowahyyupratama@gmail.com',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/mui.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.instagram, color: Colors.pink),
              title: Text(
                'Instagram',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                _launchURL('https://www.instagram.com/xousza');
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.github, color: Colors.black),
              title: Text(
                'GitHub',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                _launchURL('https://github.com/ditoowahyu');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.red),
              ),
              onTap: () {
                // Tambahkan logika logout sesuai kebutuhan
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/mui.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Selamat Datang!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Saya adalah seorang programmer full-stack. Saya memiliki passion dalam membangun aplikasi web yang user-friendly. Keahlian saya meliputi JavaScript, React, Node.js, dan MongoDB. Saya telah berhasil mengembangkan beberapa aplikasi web, Saya selalu mencari tantangan baru dan ingin terus belajar teknologi terbaru.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PortfolioScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Lihat Portofolio Saya',
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Aplikasi Pemesanan Makanan',
      'description':
          'Sistem pemesanan makanan online dengan fitur pembayaran dan pengiriman.',
      'image': 'assets/makanan.jpg', // Gambar proyek
    },
    {
      'title': 'Sistem Manajemen Keuangan',
      'description':
          'Aplikasi untuk mengelola keuangan pribadi dengan laporan keuangan otomatis.',
      'image': 'assets/uang.jpg', // Gambar proyek
    },
    {
      'title': 'Toko Online',
      'description':
          'E-commerce dengan fitur keranjang belanja, checkout, dan metode pembayaran.',
      'image': 'assets/tokoonline.jpg', // Gambar proyek
    },
    {
      'title': 'Aplikasi Cuaca',
      'description':
          'Aplikasi untuk memeriksa prakiraan cuaca dengan API cuaca terkini.',
      'image': 'assets/cuaca.jpg', // Gambar proyek
    },
    {
      'title': 'Sistem Absensi Online',
      'description':
          'Sistem absensi berbasis aplikasi untuk karyawan atau pelajar.',
      'image': 'assets/absensi.jpg', // Gambar proyek
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portofolio Saya',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    project['image']!,
                    height: 200, // Ukuran gambar disesuaikan
                    width: double.infinity,
                    fit: BoxFit
                        .cover, // Agar gambar menutupi area dengan proporsional
                  ),
                  SizedBox(height: 10),
                  Text(
                    project['title']!,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    project['description']!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
