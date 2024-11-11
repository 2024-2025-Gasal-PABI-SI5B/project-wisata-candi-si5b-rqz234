// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../models/candi_model.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  DetailScreen({required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(candi.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              candi.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Lokasi: ${candi.location}"),
            Text("Dibangun: ${candi.builtIn}"),
            Text("Tipe: ${candi.type}"),
            SizedBox(height: 16),
            Text("Deskripsi:"),
            Text(candi.description),
            SizedBox(height: 16),
            Text("Galeri:"),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: candi.gallery.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(candi.gallery[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
