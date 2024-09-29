import 'package:flutter/material.dart';
import 'package:monkey_money/theme.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
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
                text: 'ccount',
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
