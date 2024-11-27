import 'package:flutter/material.dart';
import 'package:project_akhir/keranjang/cart.dart';
import 'package:project_akhir/product/all_produk.dart';
import 'package:project_akhir/product/product_view.dart';
import 'package:project_akhir/profile/profile_page.dart';
import 'package:project_akhir/product/all_model.dart';

import '../konversi/konversi_page.dart';

const accessoriesColor = Color(0xffeab56f);

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
          "KERANJANG",
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
      body: _buildCartItems(context),
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

  Widget _buildCartItems(BuildContext context) {
    return ListView.builder(
      itemCount: Cart.cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Image.network(
              Cart.cartItems[index].thumbnail,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(Cart.cartItems[index].title),
            subtitle:
                Text('Price: \$${Cart.cartItems[index].price.toString()}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _removeItemFromCart(context, Cart.cartItems[index]);
              },
            ),
          ),
        );
      },
    );
  }

  void _removeItemFromCart(BuildContext context, Products product) {
    Cart.removeItem(product);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Produk dihapus dari keranjang'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }
}
