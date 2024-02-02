import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHEIN',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'SHEIN - Shopping Online'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Página de inicio
    Scaffold(
      appBar: AppBar(
        title: Text('SHEIN'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Banner superior
            Container(
              height: 200,
              child: Image.asset('assets/shein_banner.png'),
            ),
            // Categorías
            GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                CategoryItem(
                  title: 'Vestidos',
                  image: 'assets/shein_category_dress.png',
                ),
                CategoryItem(
                  title: 'Blusas',
                  image: 'assets/shein_category_top.png',
                ),
                CategoryItem(
                  title: 'Pantalones',
                  image: 'assets/shein_category_pants.png',
                ),
                CategoryItem(
                  title: 'Zapatos',
                  image: 'assets/shein_category_shoes.png',
                ),
              ],
            ),
            // Productos destacados
            SectionTitle(title: 'Productos destacados'),
            GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                ProductItem(
                  image: 'assets/shein_product1.png',
                  title: 'Vestido de verano',
                  price: '\$20.00',
                ),
                ProductItem(
                  image: 'assets/shein_product2.png',
                  title: 'Blusa con estampado floral',
                  price: '\$15.00',
                ),
                ProductItem(
                  image: 'assets/shein_product3.png',
                  title: 'Pantalones jeans',
                  price: '\$30.00',
                ),
                ProductItem(
                  image: 'assets/shein_product4.png',
                  title: 'Zapatos deportivos',
                  price: '\$40.00',
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    // Página de favoritos
    Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: Center(
        child: Text('Tus favoritos'),
      ),
    ),
    // Página de perfil
    Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Text('Tu perfil'),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItem({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(image),
          Text(title),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductItem({Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(image),
          Text(title),
          Text(price),
        ],
      ),
    );
  }
}
