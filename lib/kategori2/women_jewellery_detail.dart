import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori2/women_jewellery_deskripsi.dart';
import 'package:project_akhir/kategori2/women_jewellery_model.dart';

const accessoriesColor = Color(0xffeab56f);

class womenanting extends StatefulWidget {
  const womenanting({super.key});

  @override
  State<womenanting> createState() => _womenantingState();
}

class _womenantingState extends State<womenanting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "WOMENS JEWELLERY",
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
          future: ApiDataSource.instance.loadWomenJewellery(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              PerhiasanWanita perhiasanwanita =
                  PerhiasanWanita.fromJson(snapshot.data);
              return _buildSuccessSection(perhiasanwanita);
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

  Widget _buildSuccessSection(PerhiasanWanita data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemPerhiasanWanita(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemPerhiasanWanita(Products PerhiasanWanita) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              PerhiasanWanita.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              PerhiasanWanita.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${PerhiasanWanita.rating} /5.0',
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
                    builder: (context) =>
                        DesWomenperhiasan(perhiasanwanita: PerhiasanWanita),
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
