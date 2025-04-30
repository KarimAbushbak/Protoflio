import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      width: double.infinity,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'About Me',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm a creative and detail-oriented Flutter developer with a strong passion for crafting high-quality mobile and web applications. I thrive on turning innovative ideas into seamless digital experiences, combining beautiful design with clean, efficient code. Always eager to learn and adapt, I enjoy working on challenging projects that push the boundaries of what's possible with Flutter.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () async {
            final Uri cvUrl = Uri.parse(
                'https://drive.google.com/uc?export=download&id=1Rpo2Mh6g2-iYY68ow_kfk4FEx6AHIgXg');
            if (await canLaunchUrl(cvUrl)) {
              await launchUrl(cvUrl, mode: LaunchMode.externalApplication);
            } else {
              print('Could not launch CV link.');
            }
          },
          icon: const Icon(Icons.download),
          label: const Text('Download CV'),
        ),
      ]),
    );
  }
}
