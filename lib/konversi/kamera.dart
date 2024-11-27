import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project_akhir/product/product_view.dart';
import 'package:project_akhir/profile/profile_page.dart';

const accessoriesColor = Color(0xffeab56f);

class kamera extends StatefulWidget {
  const kamera({super.key});

  @override
  State<kamera> createState() => _kameraState();
}

class _kameraState extends State<kamera> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        // Pindah ke halaman Home
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const product_page()));
      } else if (index == 1) {
        // Pindah ke halaman Camera
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const kamera()));
      } else if (index == 2) {
        // Pindah ke halaman Profile
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    });
  }

  String _image = "";
  final ImagePicker _picker = ImagePicker();
  Future<String> getImage(bool isCamera) async {
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "KAMERA AKSES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    _image = await getImage(false);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Warna teks pada button
                    minimumSize: const Size(150, 50), // Ukuran minimum tombol
                  ),
                  icon: const Icon(Icons.image),
                  label:
                      const Text('Select from Gallery'), // Teks di samping ikon
                ),
                const SizedBox(width: 20), // Spasi antara tombol
                ElevatedButton.icon(
                  onPressed: () async {
                    _image = await getImage(true);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Warna teks pada button
                    minimumSize: const Size(150, 50), // Ukuran minimum tombol
                  ),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take a Photo'), // Teks di samping ikon
                ),
              ],
            ),
            const SizedBox(height: 30),
            _image.isEmpty
                ? Container()
                : Image.file(
                    File(_image),
                    height: 300,
                    width: 300,
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
