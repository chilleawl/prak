import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/laptop_deskripsi.dart';
import 'package:project_akhir/kategori/laptop_model.dart';

const accessoriesColor = Color(0xffeab56f);

class laptop extends StatefulWidget {
  const laptop({super.key});

  @override
  State<laptop> createState() => _laptopState();
}

class _laptopState extends State<laptop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "LAPTOPS",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListLaptopBody(),
    );
  }

  Widget _buildListLaptopBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadLaptop(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Laptop laptop = Laptop.fromJson(snapshot.data);
              return _buildSuccessSection(laptop);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return const Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(Laptop data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemLaptop(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemLaptop(Products Laptop) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Laptop.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Laptop.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Laptop.rating} /5.0',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesLaptop(laptop: Laptop),
                  ),
                );
              },
              child: const Text("Detail"),
            )
          ],
        ),
      ),
    );
  }
}
