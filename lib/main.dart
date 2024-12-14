import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  HomeScreen({super.key});

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
            textStyle:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text(
                'Dito Wahyu Pratama',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              accountEmail: Text(
                'ditoowahyyupratama@gmail.com',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/mui.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(FontAwesomeIcons.instagram, color: Colors.pink),
              title: Text(
                'Instagram',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                _launchURL('https://www.instagram.com/xousza');
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.github, color: Colors.black),
              title: Text(
                'GitHub',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                _launchURL('https://github.com/ditoowahyu');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Colors.green),
              title: Text(
                'Kalkulator',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculatorScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
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
              const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/mui.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                'Selamat Datang!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Saya adalah seorang programmer full-stack. Saya memiliki passion dalam membangun aplikasi web yang user-friendly. Keahlian saya meliputi JavaScript, React, Node.js, dan MongoDB. Saya telah berhasil mengembangkan beberapa aplikasi web. Saya selalu mencari tantangan baru dan ingin terus belajar teknologi terbaru.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PortfolioScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Lihat Portofolio Saya',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
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
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {
        'title': 'Aplikasi Pemesanan Makanan',
        'description':
            'Sistem pemesanan makanan online dengan fitur pembayaran dan pengiriman.',
        'image': 'assets/makanan.jpg',
      },
      {
        'title': 'Sistem Manajemen Keuangan',
        'description':
            'Aplikasi untuk mengelola keuangan pribadi dengan laporan keuangan otomatis.',
        'image': 'assets/uang.jpg',
      },
      {
        'title': 'Toko Online',
        'description':
            'E-commerce dengan fitur keranjang belanja, checkout, dan metode pembayaran.',
        'image': 'assets/tokoonline.jpg',
      },
      {
        'title': 'Aplikasi Cuaca',
        'description':
            'Aplikasi untuk memeriksa prakiraan cuaca dengan API cuaca terkini.',
        'image': 'assets/cuaca.jpg',
      },
      {
        'title': 'Sistem Absensi Online',
        'description':
            'Sistem absensi berbasis aplikasi untuk karyawan atau pelajar.',
        'image': 'assets/absensi.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portofolio Saya',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
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
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project['title']!,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
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

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      _input += value;
    });
  }

  void _calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_input);
      ContextModel cm = ContextModel();
      var eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = eval.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  void _clear() {
    setState(() {
      _input = '';
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _result,
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                final buttons = [
                  '7', '8', '9', '/',
                  '4', '5', '6', '*',
                  '1', '2', '3', '-',
                  'C', '0', '=', '+',
                ];
                final value = buttons[index];
                return ElevatedButton(
                  onPressed: () {
                    if (value == '=') {
                      _calculateResult();
                    } else if (value == 'C') {
                      _clear();
                    } else {
                      _onButtonPressed(value);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: value == '=' ? Colors.blue : Colors.grey[300],
                  ),
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: value == '=' ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
