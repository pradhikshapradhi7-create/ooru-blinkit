import 'package:flutter/material.dart';

void main() {
  runApp(const OoruBlinkitApp());
}

class OoruBlinkitApp extends StatelessWidget {
  const OoruBlinkitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ooru Blinkit',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('🛒 Namma Ooru Delivery', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Cart page-ku pogum
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Voice Search / Search Bar Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Porulgalai theda inge ezhudhungal...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Voice Search Button (Mic)
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.green),
                    onPressed: () {
                      // Voice search action inge varum
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 2. Banner / Special Notification
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.flash_on, color: Colors.orange, size: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '⚡ 10 Nimishathula Veetukku Varum! Oorukulla free delivery.',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 3. Categories Header
            const Text(
              'Thevaiyana Porulgal (Categories)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Categories Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                CategoryCard(title: '🥛 Paal & Thotthi', icon: Icons.local_drink),
                CategoryCard(title: '🍅 Kaikarigal', icon: Icons.eco),
                CategoryCard(title: '🍚 Arisi & Paruppu', icon: Icons.shopping_basket),
                CategoryCard(title: '🍪 Snacks & Tea', icon: Icons.coffee),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
