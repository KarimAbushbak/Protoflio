import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  // Strongly typed list of social links with tooltips
  final List<({IconData icon, String label, String url})> socialLinks = const [
    (
    icon: FontAwesomeIcons.github,
    label: 'GitHub',
    url: 'https://github.com/KarimAbushbak'
    ),
    (
    icon: FontAwesomeIcons.linkedin,
    label: 'LinkedIn',
    url: 'https://www.linkedin.com/in/karim-abushbak-6269a1362/'
    ),
    (
    icon: FontAwesomeIcons.twitter,
    label: 'Twitter',
    url: 'https://twitter.com/yourusername'
    ),
    (
    icon: FontAwesomeIcons.instagram,
    label: 'Instagram',
    url: 'https://www.instagram.com/karim_abushbak/'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: socialLinks.map((social) {
        return Tooltip(
          message: social.label,
          child: InkWell(
            onTap: () async {
              final uri = Uri.parse(social.url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: FaIcon(
                social.icon,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
