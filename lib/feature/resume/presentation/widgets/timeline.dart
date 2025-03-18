import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:py_site/feature/resume/domain/entities/timeline_item_entity.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:py_site/core/theme/presentation/bloc/theme_state.dart';
import 'package:py_site/core/utils/responsive.dart';

class Timeline extends StatelessWidget {
  final TimelineItemEntity item;

  const Timeline({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        Color circleColor =
            item.isHighlighted
                ? Colors.orange[400]!
                : (state.isDarkMode ? Colors.white : Colors.black);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Beginning Divider
            SizedBox(
              height: Responsive.getProportionateScreenHeight(context, 50),
              child: VerticalDivider(thickness: 1.5),
            ),

            // Main Content
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Circle Indicator
                Container(
                  width: Responsive.getProportionateScreenWidth(context, 16),
                  height: Responsive.getProportionateScreenWidth(context, 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),

                // Spacer
                SizedBox(
                  width: Responsive.getProportionateScreenWidth(context, 10),
                ),

                // Title and Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: Responsive.getProportionateScreenWidth(
                            context,
                            24,
                          ),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        item.details,
                        style: TextStyle(
                          fontSize: Responsive.getProportionateScreenWidth(
                            context,
                            18,
                          ),
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),

                // Spacer
                SizedBox(
                  width: Responsive.getProportionateScreenWidth(context, 40),
                ),

                // Date Range
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.getProportionateScreenWidth(
                      context,
                      5,
                    ),
                  ),
                  height: Responsive.getProportionateScreenHeight(context, 24),
                  width: Responsive.getProportionateScreenWidth(context, 144),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Responsive.getProportionateScreenWidth(context, 30),
                    ),
                    color: Colors.transparent,
                    border: Border.all(
                      width: Responsive.getProportionateScreenWidth(
                        context,
                        1.5,
                      ),
                      color: state.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item.dateRange,
                    style: TextStyle(
                      fontSize: Responsive.getProportionateScreenWidth(
                        context,
                        12,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Ending Divider
            SizedBox(
              height: Responsive.getProportionateScreenHeight(context, 50),
              child: VerticalDivider(thickness: 1.5),
            ),
          ],
        );
      },
    );
  }
}
