import 'package:flutter/material.dart';
import 'package:monkey_money/theme.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  AnalyticsViewState createState() => AnalyticsViewState();
}

class AnalyticsViewState extends State<AnalyticsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'A',
                style: AppTheme.appBarFirstText,
              ),
              TextSpan(
                text: 'ssets',
                style: AppTheme.appBarLastText,
              ),
            ],
          ),
        ),
      ),
      body: const Center(),
    );
  }
}
