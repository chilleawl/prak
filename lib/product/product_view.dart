import 'package:flutter/material.dart';
import 'package:project_akhir/kategori/furniture_detail.dart';
import 'package:project_akhir/kategori/home_detail.dart';
import 'package:project_akhir/kategori/laptop_detail.dart';
import 'package:project_akhir/kategori/men_baju_detail.dart';
import 'package:project_akhir/kategori/men_jam_detail.dart';
import 'package:project_akhir/kategori/men_sepatu_detail.dart';
import 'package:project_akhir/kategori/motor_detail.dart';
import 'package:project_akhir/kategori/parfum_detail.dart';
import 'package:project_akhir/kategori/phone_detail.dart';
import 'package:project_akhir/kategori/skincare_detail.dart';
import 'package:project_akhir/kategori2/women_bag_detail.dart';
import 'package:project_akhir/kategori2/women_dress_detail.dart';
import 'package:project_akhir/kategori2/women_jewellery_detail.dart';
import 'package:project_akhir/kategori2/women_shoes_detail.dart';
import 'package:project_akhir/kategori2/women_watches_detail.dart';
import 'package:project_akhir/keranjang/card_page.dart';
import 'package:project_akhir/product/all_produk.dart';
import 'package:project_akhir/profile/profile_page.dart';

import '../konversi/konversi_page.dart';

const accessoriesColor = Color(0xffeab56f);

class product_page extends StatefulWidget {
  const product_page({super.key});

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  int _selectedIndex = 0;

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
          "KATEGORI PRODUK",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: accessoriesColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(
                'All Produk',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const all_produk();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(
                'Kategori Produk',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const product_page();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(
                'Keranjang',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartPage();
                }));
              },
            ),
          ],
        ),
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
                        return const phone();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/phone.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "SMARTPHONE",
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
                        return const laptop();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/laptop.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "LAPTOP",
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
                        return const skincare();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/skincare.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "SKINCARE",
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
                        return const furniture();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/furniture.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "FURNITURE",
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
                        return const HomeDeco();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/interior.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "HOME DECORATIONS",
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
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
                        return const parfum();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/parfum.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "FRAGRANCES",
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
                        return const menbaju();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/baju.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "MENS SHIRTS",
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
                        return const mensepatu();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/sepatup.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "MENS SHOES",
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
                        return const menjam();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/jamp.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "MENS WATCHES",
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
                        return const motorcycle();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/motor.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "MOTORCYCLE",
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
                        return const womenbaju();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/dress.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WOMENS DRESSES",
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
                        return const womensepatu();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/sepatuw.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WOMENS SHOES",
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
                        return const womentas();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/bagw.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WOMENS BAGS",
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
                        return const womenanting();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/anting.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WOMENS JEWELLERY",
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
                        return const womenjam();
                      }));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/jamw.png',
                            width: 125,
                            height: 125,
                          ),
                          const Text(
                            "WOMENS WATCHES",
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
