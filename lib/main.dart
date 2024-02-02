import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    Center(child: Text('Contenido de Apps')),
    Center(child: Text('Contenido de Games')),
    Center(child: Text('Contenido de Arcade')),
    Center(child: Text('Contenido de Search')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeaponStore'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Apps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Arcade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Top de Apps'),
          // Agrega la lógica para mostrar el contenido de Top de Apps
        ),
        ListTile(
          title: Text('Publicidad'),
          // Agrega la lógica para mostrar el contenido de Publicidad
        ),
        ListTile(
          title: Text('Libros'),
          // Agrega la lógica para mostrar el contenido de Libros
        ),
        ListTile(
          title: Text('Juegos'),
          // Agrega la lógica para mostrar el contenido de Juegos
        ),
        ListTile(
          title: Text('Noticias'),
          // Agrega la lógica para mostrar el contenido de Noticias
        ),
        // Puedes agregar más subcategorías según sea necesario
      ],
    );
  }
}
