// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../models/candi_model.dart';
import '../data/favorite_data.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;

  DetailScreen({required this.candi});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = favoriteCandies.contains(widget.candi);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favoriteCandies.remove(widget.candi);
      } else {
        favoriteCandies.add(widget.candi);
      }
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.candi.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.candi.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Lokasi: ${widget.candi.location}"),
            Text("Dibangun: ${widget.candi.builtIn}"),
            Text("Tipe: ${widget.candi.type}"),
            SizedBox(height: 16),
            Text("Deskripsi:"),
            Text(widget.candi.description),
            SizedBox(height: 16),
            Text("Galeri:"),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.candi.gallery.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(widget.candi.gallery[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                label: Text(isFavorite ? 'Hapus dari Favorit' : 'Tambah ke Favorit'),
                onPressed: toggleFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
