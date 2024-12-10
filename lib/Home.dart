import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:helloworld/CartScreenAPI.dart';
import 'package:helloworld/Hienthisanpham.dart';
import 'package:helloworld/ListProductAPI.dart';
import 'VideoPlayerScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define pages for navigation
  final List<Widget> _pages = [
    ListProductAPI(),
    VideoPlayerScreen(),
    //Hienthisanpham(),
    CartScreenAPI(),
  ];

  // Function to handle tab switching
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of images for the carousel
  final List<String> _carouselImages = [
    'https://img.freepik.com/premium-vector/ho-chi-minh-city-vietnam-skyline-with-panorama-white-background-vector-illustration-business-travel-tourism-concept-with-modern-buildings-image-banner-web-site_596401-63.jpg?w=1060',
    'https://storage.googleapis.com/blogvxr-uploads/2020/10/A%CC%89nh-de%CC%A3p-Vie%CC%A3%CC%82t-Nam.jpg',
    'https://storage.googleapis.com/blogvxr-uploads/2020/10/Ta%CC%81c-pha%CC%82%CC%89m-Su%CC%9Bo%CC%9Bng-So%CC%9B%CC%81m-a%CC%89nh-de%CC%A3p-phong-ca%CC%89nh-Vie%CC%A3%CC%82t-Nam.jpg',
    'https://storage.googleapis.com/blogvxr-uploads/2020/10/Vu%CC%83-co%CC%82ng-tre%CC%82n-bie%CC%82%CC%89n-a%CC%89nh-de%CC%A3p-Vie%CC%A3%CC%82t-Nam.jpg',
    'https://storage.googleapis.com/blogvxr-uploads/2020/10/Do%CC%81n-na%CC%86%CC%81ng-a%CC%89nh-de%CC%A3p-phong-ca%CC%89nh-Vie%CC%A3%CC%82t-Nam.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 150, // Adjust height as needed
          child: CarouselSlider(
            items: _carouselImages
                .map((imageUrl) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 140, // Adjust height for the carousel
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 1.0,
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
