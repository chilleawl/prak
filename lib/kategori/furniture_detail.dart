import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/furniture_deskripsi.dart';
import 'package:project_akhir/kategori/furniture_model.dart';

const accessoriesColor = Color(0xffeab56f);

class furniture extends StatefulWidget {
  const furniture({Key? key}) : super(key: key);

  @override
  State<furniture> createState() => _furnitureState();
}

class _furnitureState extends State<furniture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "FURNITURE",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildListFurnitureBody(),
    );
  }

  Widget _buildListFurnitureBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadFurniture(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Furniture furniture = Furniture.fromJson(snapshot.data);
            return _buildSuccessSection(furniture);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return const Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(Furniture data) {
    return ListView.builder(
      itemCount: data.products.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemFurniture(data.products[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemFurniture(Products Furniture) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Furniture.thumbnail,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Furniture.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Furniture.rating} /5.0',
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
                    builder: (context) => DesFurniture(furniture: Furniture),
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
