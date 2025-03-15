import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/utils/responsive.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
          // Education Title
          Text(
            "Education",
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

          // Education Details
          EducationItem(
            school:
                "The Affiliate Zhongli Senior High School of National University",
            details: "Computer Science score in the top 1% of the grade",
            dateRange: "Sep. 2019 ~ Jun. 2022",
          ),
          EducationItem(
            school: "National Central University",
            details:
                "B.S. in Computer Science and Information Engineering. Cumulative average: 91.57/100.",
            dateRange: "Sep. 2022 ~ Current",
            isHighlighted: true,
          ),
        ],
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String school;
  final String details;
  final String dateRange;
  final bool isHighlighted;

  const EducationItem({
    required this.school,
    required this.details,
    required this.dateRange,
    this.isHighlighted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        Color circleColor =
            isHighlighted
                ? Colors.orange[400]!
                : (state.isDarkMode ? Colors.white : Colors.black);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Responsive.getProportionateScreenHeight(context, 50),
              child: VerticalDivider(thickness: 1.5),
            ),
            Row(
              children: [
                // 圓形標記
                Container(
                  width: Responsive.getProportionateScreenWidth(context, 16),
                  height: Responsive.getProportionateScreenWidth(context, 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),
                SizedBox(width: Responsive.getProportionateScreenWidth(context, 10)),
                
                // 學校名稱與細節
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      school,
                      style: TextStyle(
                        fontSize: Responsive.getProportionateScreenWidth(context, 24),
                      ),
                    ),
                    Text(
                      details,
                      style: TextStyle(
                        fontSize: Responsive.getProportionateScreenWidth(context, 18),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                
                // 日期範圍框
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.getProportionateScreenWidth(context, 5),
                  ),
                  height: Responsive.getProportionateScreenHeight(context, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Responsive.getProportionateScreenWidth(context, 30),
                    ),
                    color: Colors.transparent,
                    border: Border.all(
                      width: Responsive.getProportionateScreenWidth(context, 1.5),
                      color: state.isDarkMode ? Colors.white : Colors.black, // 根據 mode 切換顏色
                    ),
                  ),
                  child: Text(
                    dateRange,
                    style: TextStyle(
                      fontSize: Responsive.getProportionateScreenWidth(context, 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
