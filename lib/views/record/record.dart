import 'package:flutter/material.dart';
import 'package:monkey_money/theme.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  RecordViewState createState() => RecordViewState();
}

class RecordViewState extends State<RecordView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'R',
                style: AppTheme.appBarFirstText,
              ),
              TextSpan(
                text: 'ecord',
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
