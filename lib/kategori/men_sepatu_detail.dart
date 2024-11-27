import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/men_sepatu_deskripsi.dart';
import 'package:project_akhir/kategori/men_sepatu_model.dart';

const accessoriesColor = Color(0xffeab56f);

class mensepatu extends StatefulWidget {
  const mensepatu({super.key});

  @override
  State<mensepatu> createState() => _mensepatuState();
}

class _mensepatuState extends State<mensepatu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MENS SHOES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListmensepatuBody(),
    );
  }

  Widget _buildListmensepatuBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadMenShoes(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              SepatuPria sepatupria = SepatuPria.fromJson(snapshot.data);
              return _buildSuccessSection(sepatupria);
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

  Widget _buildSuccessSection(SepatuPria data) {
    return ListView.builder(
      itemCount: data.products.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemSepatuPria(data.products[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemSepatuPria(Products SepatuPria) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              SepatuPria.thumbnail,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              SepatuPria.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${SepatuPria.rating} /5.0',
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
                    builder: (context) => DesSepatuPria(sepatupria: SepatuPria),
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
