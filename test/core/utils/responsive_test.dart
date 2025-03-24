import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:py_site/core/utils/responsive.dart';

void main() {
  group('Responsive', () {
    testWidgets('getWidth and getHeight return correct screen size', (WidgetTester tester) async {
      const double testWidth = 1440.0;
      const double testHeight = 900.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(testWidth, testHeight)),
          child: Builder(
            builder: (context) {
              expect(Responsive.getWidth(context), testWidth);
              expect(Responsive.getHeight(context), testHeight);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('getProportionateScreenWidth returns correct proportion', (WidgetTester tester) async {
      const double testWidth = 720.0;
      const double baseWidth = 1440.0;
      const double inputWidth = 360.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(testWidth, 900.0)),
          child: Builder(
            builder: (context) {
              double result = Responsive.getProportionateScreenWidth(context, inputWidth, baseWidth: baseWidth);
              expect(result, inputWidth / baseWidth * testWidth);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('getProportionateScreenHeight returns correct proportion', (WidgetTester tester) async {
      const double testHeight = 450.0;
      const double baseHeight = 900.0;
      const double inputHeight = 225.0;

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1440.0, testHeight)),
          child: Builder(
            builder: (context) {
              double result = Responsive.getProportionateScreenHeight(context, inputHeight, baseHeight: baseHeight);
              expect(result, inputHeight / baseHeight * testHeight);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('Handles zero and negative dimensions gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(0, 0)),
          child: Builder(
            builder: (context) {
              expect(Responsive.getWidth(context), 0);
              expect(Responsive.getHeight(context), 0);

              double widthResult = Responsive.getProportionateScreenWidth(context, 100);
              double heightResult = Responsive.getProportionateScreenHeight(context, 100);

              expect(widthResult.isNaN || widthResult == 0, true);
              expect(heightResult.isNaN || heightResult == 0, true);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
