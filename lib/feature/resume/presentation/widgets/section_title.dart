import 'package:flutter/material.dart';
import 'package:py_site/core/utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Responsive.getProportionateScreenWidth(context, 48),
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}
