import 'package:flutter/material.dart';

void main() {
  runApp(const ImageGridApp());
}

class ImageGridApp extends StatelessWidget {
  const ImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Image Grid'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImageGridScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  final List<String> imageUrls = const [
    'https://png.pngtree.com/thumb_back/fh260/background/20240801/pngtree-new-cb-background-images-photos-pics-wallpaper-pictures-image_16123145.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSca37bB9I9ja8qwz6MXq84Gb4VR1zoxkwGLg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe_OlHEe2L-0VtexCxjIV5tc0dLor3wd57Yg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShfrLRLJDTroCqhzzPtqh-4kjWA5L1JmBKbg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSca37bB9I9ja8qwz6MXq84Gb4VR1zoxkwGLg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG2pcubqMbL0tKpJOt_5ygJe4vGSLBKF7ttw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA6MLT2lpj3M85eFPT2oNNivGYx_saZEww8Q&s',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600
        ? 2
        : screenWidth < 900
            ? 3
            : 4;

    return Scaffold(
      appBar: AppBar(title: const Text('Image Grid')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Center(
        child: Text(
          'This is a demo app showcasing a navigation drawer with multiple screens.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
