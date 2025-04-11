import 'package:flutter/material.dart';
import 'package:virtual_try_on/presentation/widgets/3d_viewer.dart';
import 'package:virtual_try_on/presentation/widgets/outfit_picker.dart';
import 'package:virtual_try_on/presentation/widgets/product_details.dart';
import 'package:virtual_try_on/presentation/widgets/search_widgets.dart';
import 'package:virtual_try_on/presentation/widgets/vertical_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(
      child: Text(
        'Home Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Search Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Cart Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Featured Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    const Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(fontSize: 24),
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
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg-image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1200,
                minWidth: 600,
              ),
              child: Column(
                children: [
                  const SearchAppBar(),
                  Expanded(
                    child: Row(
                      children: [
                        VerticalNavBar(
                          selectedIndex: _selectedIndex,
                          onItemSelected: _onItemTapped,
                        ),
                        Flexible(child: OutfitSelectionScreen()),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(181, 49, 49, 49),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // child: ThreeJSExample(),
                          ),
                        ),
                        Flexible(flex: 2, child: ProductDetailsScreen()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
