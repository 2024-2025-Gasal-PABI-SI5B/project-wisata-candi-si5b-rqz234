// lib/screens/search_screen.dart
import 'package:flutter/material.dart';
import '../data/candi_data.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List candiListFiltered = candiList; // Awalnya menampilkan semua candi

  @override
  void initState() {
    super.initState();

    // Memperbarui daftar saat teks diubah
    _searchController.addListener(() {
      setState(() {
        candiListFiltered = candiList.where((candi) {
          final query = _searchController.text.toLowerCase();
          return candi.name.toLowerCase().contains(query) ||
              candi.location.toLowerCase().contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pencarian Candi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari candi...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: candiListFiltered.length,
              itemBuilder: (context, index) {
                final candi = candiListFiltered[index];
                return ListTile(
                  leading: Image.asset(
                    candi.gallery[0], // Gambar pertama dari galeri
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(candi.name),
                  subtitle: Text(candi.location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
