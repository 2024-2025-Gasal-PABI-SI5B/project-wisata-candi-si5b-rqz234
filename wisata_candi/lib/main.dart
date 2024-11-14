// lib/main.dart
import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/login_screen.dart';
import 'package:wisata_candi/screens/register_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/search_screen.dart';
// import 'screens/favorite_screen.dart';
// import 'screens/profile_screen.dart';

void main() {
  runApp(WisataCandiApp());
}

class WisataCandiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // HomeScreen(),
    // SearchScreen(),
    // FavoriteScreen(),
    // ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black, // Ikon tidak terpilih berwarna hitam
        selectedItemColor: Colors.blue, // Ikon terpilih berwarna biru
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
