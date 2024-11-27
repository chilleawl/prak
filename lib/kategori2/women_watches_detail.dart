import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori2/women_watches_deskripsi.dart';
import 'package:project_akhir/kategori2/womens_watches_model.dart';

const accessoriesColor = Color(0xffeab56f);

class womenjam extends StatefulWidget {
  const womenjam({super.key});

  @override
  State<womenjam> createState() => _womenjamState();
}

class _womenjamState extends State<womenjam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "WOMENS WATCHES",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListwomenperhiasanBody(),
    );
  }

  Widget _buildListwomenperhiasanBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadWomenWatches(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              JamWanita jamwanita = JamWanita.fromJson(snapshot.data);
              return _buildSuccessSection(jamwanita);
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

  Widget _buildSuccessSection(JamWanita data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemJamWanita(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemJamWanita(Products JamWanita) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              JamWanita.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              JamWanita.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${JamWanita.rating} /5.0',
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
                    builder: (context) => DesWomenjam(jamwanita: JamWanita),
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
