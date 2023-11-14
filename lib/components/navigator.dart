import 'package:flutter/material.dart';
import 'package:xfood/pages/home_page.dart';
import 'package:xfood/pages/pedidos_page.dart';

import '../widgets/gaveta.dart';

class NavigatorApp extends StatefulWidget {
  const NavigatorApp({super.key});

  @override
  State<NavigatorApp> createState() => _NavigatorState();
}

class _NavigatorState extends State<NavigatorApp> {

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [];

  @override
  void initState(){
    super.initState();
    _widgetOptions.addAll([const HomePage(), const PedidosPage()]);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Gaveta(),
       appBar: AppBar(
          title: const Text("XFood"),
          backgroundColor: Colors.red[900],
          centerTitle: true,
          leading: Builder(
          builder: (context) => IconButton(
            icon:const Icon(Icons.shopping_cart),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,
        backgroundColor: Colors.red[900],
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                weight: 500.0,
                size: 25,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.folder,
                weight: 500.0,
                size: 25,
                color: Colors.white,
              ),
              label: "Pedidos"),
        ],
      )
    );
  }
}