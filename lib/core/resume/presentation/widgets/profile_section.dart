import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        SizedBox(height: 20),
        Text(
          "PoYen",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "Student / Developer",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}
