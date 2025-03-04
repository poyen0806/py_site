import 'package:flutter/material.dart';
import 'package:py_site/core/theme/presentation/widgets/theme_toggle_button.dart';
import 'package:py_site/core/resume/presentation/widgets/profile_section.dart';
import 'package:py_site/core/resume/presentation/widgets/skill_section.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ThemeToggleButton()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ProfileSection(),
            SizedBox(height: 20),
            Text(
              "Email: poyen@example.com",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            SkillSection(),
          ],
        ),
      ),
    );
  }
}