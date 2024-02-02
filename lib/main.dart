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
  final List<Map<String, String>> topApps = [
    {'title': 'Bitso', 'image': 'app1_image_url'},
    {'title': 'Binance', 'image': 'app2_image_url'},
    {'title': 'Facebook', 'image': 'app3_image_url'},
  
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Top de Apps'),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topApps.length,
            itemBuilder: (context, index) {
              return AppWidget(
                title: topApps[index]['title']!,
                image: topApps[index]['image']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class AppWidget extends StatelessWidget {
  final String title;
  final String image;

  AppWidget({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 50,
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
