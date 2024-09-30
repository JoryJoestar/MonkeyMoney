import 'package:flutter/material.dart';
import 'package:monkey_money/theme.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'I',
                style: AppTheme.appBarFirstText,
              ),
              TextSpan(
                text: 'nsights',
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
