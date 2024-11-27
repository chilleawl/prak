import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/home_deskripsi.dart';
import 'package:project_akhir/kategori/home_model.dart';

const accessoriesColor = Color(0xffeab56f);

class HomeDeco extends StatefulWidget {
  const HomeDeco({super.key});

  @override
  State<HomeDeco> createState() => _HomeDecoState();
}

class _HomeDecoState extends State<HomeDeco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "HOME DECORATION",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListHomeDecoBody(),
    );
  }

  Widget _buildListHomeDecoBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadHomeDecoration(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              HomeDekorasi homeDekorasi = HomeDekorasi.fromJson(snapshot.data);
              return _buildSuccessSection(homeDekorasi);
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

  Widget _buildSuccessSection(HomeDekorasi data) {
    return ListView.builder(
      itemCount: data.products!.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemHomeDeco(data.products![index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemHomeDeco(Products HomeDekorasi) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              HomeDekorasi.thumbnail!,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              HomeDekorasi.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${HomeDekorasi.rating} /5.0',
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
                    builder: (context) => DesHome(homeDekorasi: HomeDekorasi),
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
