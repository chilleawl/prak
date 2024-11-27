import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir/hive/datauser_model.dart';
import 'package:project_akhir/login/login_page.dart';

void main() async {
  initiateLocalDB();
  runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataUserModelAdapter());
  await Hive.openBox<DataUserModel>('data_user');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PROJECT AKHIR',
      debugShowCheckedModeBanner: false,
      home: login_page(),
    );
  }
}
