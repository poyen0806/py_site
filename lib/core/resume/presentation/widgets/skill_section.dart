import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Skills:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("• Flutter • Dart • Clean Architecture"),
        Text("• Firebase • Git • UI/UX Design"),
      ],
    );
  }
}
