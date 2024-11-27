import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/keranjang/cart.dart';
import 'package:project_akhir/product/all_model.dart';
import 'package:project_akhir/product/product_view.dart';
import 'package:project_akhir/profile/profile_page.dart';
import '../keranjang/card_page.dart';
import '../konversi/konversi_page.dart';

const accessoriesColor = Color(0xffeab56f);

class all_produk extends StatefulWidget {
  const all_produk({super.key});

  @override
  State<all_produk> createState() => _all_produkState();
}

class _all_produkState extends State<all_produk> {
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
          "ALL PRODUCT",
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
      body: _buildListAllBody(),
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

  Widget _buildListAllBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadAll(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print('ERROR : ${snapshot.error}');
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              AllProduk all = AllProduk.fromJson(snapshot.data);
              return _buildSuccessSection(all);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return const Center(
      child: Text("Terjadi kesalahan saat memuat data. Periksa koneksi Anda."),
    );
  }

  Widget _buildSuccessSection(AllProduk data) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Menentukan jumlah kolom dalam grid
        crossAxisSpacing: 10.0, // Spasi antar kolom
        mainAxisSpacing: 10.0, // Spasi antar baris
        childAspectRatio:
            0.75, // Perbandingan tinggi terhadap lebar setiap item
      ),
      itemCount: data.products.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemAll(data.products[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemAll(Products allProduct) {
    return InkWell(
      child: Card(
        elevation: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Image.network(
                allProduct.thumbnail,
                width: 220,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allProduct.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    allProduct.category,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                Cart.addToCart(allProduct);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Produk telah masuk keranjang'),
                    backgroundColor: Colors.blue,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              mini: true,
              child: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
