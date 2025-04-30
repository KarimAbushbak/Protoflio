import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  final List<Map<String, String>> projects = const [
    {
      'title': 'Chat App',
      'description': 'A real-time Flutter chat app using Firebase.',
      'image': 'assets/images/chatting.png', // sample image path
      'link': 'https://github.com/KarimAbushbak/Chatting-App',
    },
    {
      'title': 'Note App',
      'description': 'A cool NotePad App using Flutter and firebase.',
      'image': 'assets/images/note.png',
      'link': 'https://github.com/KarimAbushbak/note-firebase',
    },
    {
      'title': 'E-Commerce App',
      'description': 'Full e-commerce Flutter app with payment gateway.',
      'image': 'assets/images/ggg.png',
      'link': 'https://github.com/KarimAbushbak/advanced_Ecommerse',
    },
    {
      'title': 'Quizie',
      'description': 'A programming quiz app using Bloc and Supbase.',
      'image': 'assets/images/quiz.png',
      'link': 'https://github.com/KarimAbushbak/Quiz-App',
    },
    {
      'title': 'News',
      'description': 'A full real-time News app using  Flutter and api ',
      'image': 'assets/images/news.png',
      'link': 'https://github.com/KarimAbushbak/news-app',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      width: double.infinity,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: projects.map((project) {
              return ProjectCard(
                title: project['title']!,
                description: project['description']!,
                imagePath: project['image']!,
                link: project['link']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String link;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async {
                      final uri = Uri.parse(link);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      } else {
                        // You could show a snackbar or error
                        print('Could not launch $link');
                      }
                    },
                    child: const Text('View Project'),
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
