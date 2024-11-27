import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori2/women_bag_deskripsi.dart';
import 'package:project_akhir/kategori2/women_bag_model.dart';

const accessoriesColor = Color(0xffeab56f);

class womentas extends StatefulWidget {
  const womentas({super.key});

  @override
  State<womentas> createState() => _womentasState();
}

class _womentasState extends State<womentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "WOMENS BAGS",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListwomentasBody(),
    );
  }

  Widget _buildListwomentasBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadWomenBag(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              TasWanita taswanita = TasWanita.fromJson(snapshot.data);
              return _buildSuccessSection(taswanita);
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

  Widget _buildSuccessSection(TasWanita data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemTasWanita(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemTasWanita(Products TasWanita) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              TasWanita.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              TasWanita.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${TasWanita.rating} /5.0',
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
                    builder: (context) => DesWomentas(taswanita: TasWanita),
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
