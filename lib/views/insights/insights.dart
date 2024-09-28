import 'package:flutter/material.dart';

class InsightsView extends StatefulWidget {
  const InsightsView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  InsightsViewState createState() => InsightsViewState();
}

class InsightsViewState extends State<InsightsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Insights',
        ),
      ),
    );
  }
}
