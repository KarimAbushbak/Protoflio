import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback toggleTheme;
  final VoidCallback scrollToHero;
  final VoidCallback scrollToAbout;
  final VoidCallback scrollToSkills;
  final VoidCallback scrollToProjects;
  final VoidCallback scrollToContacts;

  const NavBar({
    Key? key,
    required this.toggleTheme,
    required this.scrollToHero,
    required this.scrollToAbout,
    required this.scrollToSkills,
    required this.scrollToProjects,
    required this.scrollToContacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Portfolio',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            children: [
              TextButton(
                onPressed: scrollToHero,
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: scrollToAbout,
                child: const Text('About'),
              ),
              TextButton(
                onPressed: scrollToSkills,
                child: const Text('Skills'),
              ),
              TextButton(
                onPressed: scrollToProjects,
                child: const Text('Projects'),
              ),
              TextButton(
                onPressed: scrollToContacts,
                child: const Text('Contacts'),
              ),


              // Later we will add Skills, Projects, Contact buttons too
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: toggleTheme,
              ),
            ],
          )
        ],
      ),
    );
  }
}
