import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessStory {
  final String name;
  final String description;
  final double rating;
  final String imageUrl;

  SuccessStory({
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });
}

class SuccessStoriesScreen extends StatelessWidget {
  final List<SuccessStory> successStories = [
    SuccessStory(
      name: 'Fardan Shoukat',
      description:
          'Your application has proven to be highly beneficial for me in navigating and completing tasks on the Upwork platform. Its features and functionality have significantly improved my efficiency and overall experience while working on various projects. I appreciate the quality of your app, as it has become an essential tool for my work on Upwork. Thank you for providing such a valuable resource.',
      rating: 4.5,
      imageUrl:
          'img/fardann.jpeg', // Assuming 'img/logoMain.png' is your image asset
    ),
    SuccessStory(
      name: 'Zohaib Afzal',
      description:
          'Your app is very good, and it has been very helpful to me in working on the Upwork platform.',
      rating: 4.5,
      imageUrl:
          'img/zohaib.jpeg', // Assuming 'img/logoMain.png' is your image asset
    ),
    SuccessStory(
      name: 'Talha Tariq',
      description:
          'Your application is excellent, and it has proven to be immensely beneficial for me while working on the Upwork platform.',
      rating: 4.5,
      imageUrl:
          'img/talha.jpeg', // Assuming 'img/logoMain.png' is your image asset
    ),
    // Add more success stories as needed
  ];

  SuccessStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Stories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 77, 156, 81),
          title: Text(
            'Success Stroies',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView.builder(
          itemCount: successStories.length,
          itemBuilder: (context, index) {
            return SuccessStoryCard(successStory: successStories[index]);
          },
        ),
      ),
    );
  }
}

class SuccessStoryCard extends StatelessWidget {
  final SuccessStory successStory;

  const SuccessStoryCard({super.key, required this.successStory});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(successStory.imageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              successStory.name,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              successStory.description,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: successStory.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Do something with the rating if needed
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessStoriesScreen();
  }
}
