import 'package:flutter/material.dart';
import 'mahasiswa_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAM + SBD',
      home: MahasiswaPage(),
    );
  }
}

class MahasiswaPage extends StatefulWidget {
  @override
  _MahasiswaPageState createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  final service = MahasiswaService();
  late Future<List<dynamic>> mahasiswas;

  @override
  void initState() {
    super.initState();
    mahasiswas = service.getMahasiswas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Mahasiswa')),
      body: FutureBuilder<List<dynamic>>(
        future: mahasiswas,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) => ListTile(
              title: Text(data[i]['nama']),
              subtitle: Text('NIM: ${data[i]['nim']} • ${data[i]['jurusan']}'),
            ),
          );
        },
      ),
    );
  }
}
