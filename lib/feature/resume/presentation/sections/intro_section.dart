import 'package:flutter/material.dart';
import 'package:py_site/core/utils/responsive.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.getProportionateScreenWidth(context, 250),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: DefaultTextStyle.of(context).style,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome, I'm",
                      style: TextStyle(
                        fontSize: Responsive.getProportionateScreenWidth(
                          context,
                          72,
                        ),
                        color: DefaultTextStyle.of(context).style.color,
                      ),
                    ),
                    TextSpan(
                      text: " PoYen\n",
                      style: TextStyle(
                        fontSize: Responsive.getProportionateScreenWidth(
                          context,
                          80,
                        ),
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[400]!,
                      ),
                    ),
                    TextSpan(
                      text: "Student / Developer",
                      style: TextStyle(
                        fontSize: Responsive.getProportionateScreenWidth(
                          context,
                          72,
                        ),
                        color: DefaultTextStyle.of(context).style.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: Responsive.getProportionateScreenWidth(context, 60)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Responsive.getProportionateScreenWidth(context, 125),
              ),
              border: Border.all(width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Responsive.getProportionateScreenWidth(context, 125),
              ),
              child: Image.asset(
                "assets/images/profile.png",
                width: Responsive.getProportionateScreenWidth(context, 250),
                height: Responsive.getProportionateScreenWidth(context, 250),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
