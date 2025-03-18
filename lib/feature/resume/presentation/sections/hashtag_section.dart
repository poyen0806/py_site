import 'package:flutter/material.dart';
import 'package:py_site/core/utils/responsive.dart';

class HashtagSection extends StatelessWidget {
  const HashtagSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getProportionateScreenWidth(context, 20),
        vertical: Responsive.getProportionateScreenWidth(context, 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hashtag Title
          Text(
            "About Me",
            style: TextStyle(
              fontSize: Responsive.getProportionateScreenWidth(context, 48),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          // Spacer
          SizedBox(
            height: Responsive.getProportionateScreenHeight(context, 20),
          ),

          // Hashtags
          Hashtag(text: "self-driven"),
          Hashtag(text: "team-player"),
          Hashtag(text: "coding-in-life"),
          Hashtag(text: "always-learning"),
          Hashtag(text: "debug-master"),
        ],
      ),
    );
  }
}

class Hashtag extends StatelessWidget {
  final String text;

  const Hashtag({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "# $text",
      style: TextStyle(
        fontSize: Responsive.getProportionateScreenWidth(context, 28),
        height: 2,
        letterSpacing: 1.2,
        wordSpacing: 1.5,
      ),
    );
  }
}
