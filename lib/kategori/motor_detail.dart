import 'package:flutter/material.dart';
import 'package:project_akhir/api/api_data_source.dart';
import 'package:project_akhir/kategori/motor_model.dart';

const accessoriesColor = Color(0xffeab56f);

class motorcycle extends StatefulWidget {
  const motorcycle({super.key});

  @override
  State<motorcycle> createState() => _motorcycleState();
}

class _motorcycleState extends State<motorcycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "MOTORCYCLE",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _buildListMotorcycleBody(),
    );
  }

  Widget _buildListMotorcycleBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadMotorcycle(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              MotorPria motorcycle = MotorPria.fromJson(snapshot.data);
              return _buildSuccessSection(motorcycle);
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

  Widget _buildSuccessSection(MotorPria data) {
    return ListView.builder(
      itemCount: data.products.length,
      itemBuilder: (BuildContext context, int index) {
        return _BuildItemMotorcycle(data.products[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemMotorcycle(Products MotorPria) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              MotorPria.thumbnail,
              width: 220,
              height: 220,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              MotorPria.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rating: ${MotorPria.rating} /5.0',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
