import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/men_baju_deskripsi.dart';
import 'package:project_akhir/kategori/men_baju_model.dart';

const accessoriesColor = Color(0xffeab56f);

class menbaju extends StatefulWidget {
  const menbaju({super.key});

  @override
  State<menbaju> createState() => _menbajuState();
}

class _menbajuState extends State<menbaju> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MENS T-SHIRT",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListmenbajuBody(),
    );
  }

  Widget _buildListmenbajuBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadMenShirts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              BajuPria bajupria = BajuPria.fromJson(snapshot.data);
              return _buildSuccessSection(bajupria);
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

  Widget _buildSuccessSection(BajuPria data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemBajuPria(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemBajuPria(Products BajuPria) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              BajuPria.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              BajuPria.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${BajuPria.rating} /5.0',
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
                    builder: (context) => DesMenbaju(bajupria: BajuPria),
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
