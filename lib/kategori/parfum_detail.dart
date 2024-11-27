import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/parfum_deskripsi.dart';
import 'package:project_akhir/kategori/parfum_model.dart';

const accessoriesColor = Color(0xffeab56f);

class parfum extends StatefulWidget {
  const parfum({super.key});

  @override
  State<parfum> createState() => _parfumState();
}

class _parfumState extends State<parfum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "FRAGRANCES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListFragrancesBody(),
    );
  }

  Widget _buildListFragrancesBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadFragrances(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Fragrances fragrances = Fragrances.fromJson(snapshot.data);
              return _buildSuccessSection(fragrances);
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

  Widget _buildSuccessSection(Fragrances data) {
    return ListView.builder(
      itemCount: data.products.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemFragrances(data.products[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemFragrances(Products Fragrances) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              Fragrances.thumbnail,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              Fragrances.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${Fragrances.rating} /5.0',
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
                    builder: (context) => DesFragrances(fragrances: Fragrances),
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
