import 'package:flutter/material.dart';
import 'package:project_akhir/konversi/uang.dart';
import 'package:project_akhir/konversi/waktu.dart';
import 'package:project_akhir/konversi/kamera.dart';
import 'package:project_akhir/product/all_produk.dart';
import 'package:project_akhir/profile/profile_page.dart';

const accessoriesColor = Color(0xffeab56f);

class konversipage extends StatefulWidget {
  const konversipage({super.key});

  @override
  State<konversipage> createState() => _konversipageState();
}

class _konversipageState extends State<konversipage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Pindah ke halaman Home
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const all_produk()));
      } else if (index == 1) {
        // Pindah ke halaman Camera
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const konversipage()));
      } else if (index == 2) {
        // Pindah ke halaman Profile
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MENU KONVERSI",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 20,
                  shadowColor: Colors.blue[800],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CurrencyConverterApp();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/uang.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "MATA UANG",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 20,
                  shadowColor: Colors.blue[800],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const TimeConversionPage();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/clock.jpg',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WAKTU",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 20,
                  shadowColor: Colors.blue[800],
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const kamera();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/kamera.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "KAMERA",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: accessoriesColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Konversi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontWeight:
                FontWeight.bold), // Set the color for selected item label
        onTap: _onItemTapped,
      ),
    );
  }
}
