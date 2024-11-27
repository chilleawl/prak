import 'package:flutter/material.dart';

const accessoriesColor = Color(0xffeab56f);

void main() {
  runApp(const MessagePage());
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accessoriesColor,
        title: const Text(
          "PESAN DAN KESAN",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageBox(
              title: 'Pesan:',
              content:
                  'Saya ucapkan terima kasih banyak banyak kepada pak bagus dan tim kurikulum yang sudah membuat mata kuliah ini. Mata kuliah ini sangat bermanfaat sekali bagi saya. Dan tolong banget jangan sampe ketemu lagi sama mata kuliah ini disemester yang akan datang.',
            ),
            SizedBox(height: 20.0),
            MessageBox(
              title: 'Kesan:',
              content:
                  'Mata kuliah pemrograman aplikasi mobile membuka mata saya terhadap kompleksitas dan keunikan yang dimiliki dalam mengembangkan aplikasi untuk perangkat mobile. Dan dengan kompleksitas yang ada membuat saya makin mengurungkan niat untuk berfokus dibidang ini. Terima kasih PAM telah menyadarkan saya',
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  final String title;
  final String content;

  const MessageBox({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Text(
            content,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
