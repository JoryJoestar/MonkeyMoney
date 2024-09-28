import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text(
          'Analytics',
        ),
      ),
    );
  }
}
