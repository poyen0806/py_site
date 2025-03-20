import 'package:flutter/material.dart';
import 'package:py_site/core/utils/responsive.dart';
import 'package:py_site/feature/resume/presentation/widgets/section_title.dart';

class SelfPromotionSection extends StatelessWidget {
  const SelfPromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getProportionateScreenWidth(context, 20),
        vertical: Responsive.getProportionateScreenHeight(context, 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Self Promotion"),
          SizedBox(height: Responsive.getProportionateScreenHeight(context, 20)),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      "Hello! I'm Po-Yen Wu, a Computer Science student at National Central University. "
      "I have a strong passion for software development and often explore new technologies. "
      "I easily spot errors in programs or applications and actively think of solutions. "
      "When code is provided, I debug it to gain more experience. In my spare time, I enjoy coding "
      "and working on personal projects to improve my skills and stay updated with the latest in tech.",
      style: TextStyle(
        fontSize: Responsive.getProportionateScreenWidth(context, 24),
        height: 1.5,
        letterSpacing: 1.2,
        wordSpacing: 1.5,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
