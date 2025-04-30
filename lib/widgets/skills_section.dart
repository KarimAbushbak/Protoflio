import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> skills = const [
    {'name': 'Flutter', 'icon': Icons.flutter_dash},
    {'name': 'Dart', 'icon': Icons.code},
    {'name': 'Firebase', 'icon': Icons.cloud},
    {'name': 'REST APIs', 'icon': Icons.api},
    {'name': 'UI/UX', 'icon': Icons.design_services},
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
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: skills.map((skill) {
              return HoverSkillCard(
                skillName: skill['name'],
                skillIcon: skill['icon'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
class HoverSkillCard extends StatefulWidget {
  final String skillName;
  final IconData skillIcon;

  const HoverSkillCard({
    Key? key,
    required this.skillName,
    required this.skillIcon,
  }) : super(key: key);

  @override
  State<HoverSkillCard> createState() => _HoverSkillCardState();
}

class _HoverSkillCardState extends State<HoverSkillCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: (_isHovering
            ? (Matrix4.identity()..scale(1.05))
            : (Matrix4.identity()..scale(1.0))),
        child: Card(
          elevation: _isHovering ? 12 : 4, // ✅ Higher elevation on hover
          shadowColor: _isHovering
              ? Theme.of(context).primaryColor.withOpacity(0.5) // ✅ Glow color
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 150,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.skillIcon,
                  size: 50,
                  color: isDarkMode
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.skillName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}

