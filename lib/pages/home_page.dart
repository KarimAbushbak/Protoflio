import 'package:flutter/material.dart';
import 'package:protfolio/widgets/contacts_section.dart';
import 'package:protfolio/widgets/projcets_section.dart';
import 'package:protfolio/widgets/skills_section.dart';
import '../widgets/about_screen.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/social_media_row.dart';

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const HomePage({Key? key, required this.toggleTheme}) : super(key: key);

  // Add GlobalKeys
  static final heroKey = GlobalKey();
  static final aboutKey = GlobalKey();
  static final skillsKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final contactsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(
              toggleTheme: toggleTheme,
              scrollToHero: () => _scrollToSection(heroKey),
              scrollToAbout: () => _scrollToSection(aboutKey),
              scrollToSkills: () => _scrollToSection(skillsKey),
              scrollToProjects: () => _scrollToSection(projectsKey),
              scrollToContacts: () => _scrollToSection(contactsKey),
            ),
            // Attach Keys here
            HeroSection(key: heroKey),
            AboutSection(key: aboutKey),
            SkillsSection(
              key: skillsKey,
            ),
            ProjectsSection(
              key: projectsKey,
            ),
            ContactSection(
              key: contactsKey,
            ),
            const SizedBox(height: 50),
            const SocialMediaRow(), 
            const SizedBox(height: 50),

          ],
        ),
      ),
    );
  }

  static void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
