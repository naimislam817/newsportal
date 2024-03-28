import 'package:flutter/material.dart';

void main() {
  runApp(NewsPortalApp());
}

class NewsPortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsPortalHomePage(),
    );
  }
}

class NewsPortalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Portal'),
      ),
      body: NewsList(), // Placeholder for displaying news articles
    );
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated list of news articles
    List<Map<String, dynamic>> newsArticles = [
      {
        'title': 'Elephant Crashes Roads',
        'subtitle': 'Recent elephant stampede causes chaos',
        'image': 'assets/elephant.jpg',
      },
      {
        'title': 'Ships Sank in the Sea',
        'subtitle': 'Multiple ships lost in a violent storm',
        'image': 'assets/ship.jpg',
      },
    ];

    return ListView.builder(
      itemCount: newsArticles.length,
      itemBuilder: (context, index) {
        return NewsCard(
          title: newsArticles[index]['title'],
          subtitle: newsArticles[index]['subtitle'],
          image: newsArticles[index]['image'],
          onTap: () {
            // Navigate to news details page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NewsDetailsPage(newsArticle: newsArticles[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  NewsCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDetailsPage extends StatelessWidget {
  final Map<String, dynamic> newsArticle;

  NewsDetailsPage({required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              newsArticle['image'],
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              newsArticle['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              newsArticle['subtitle'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
