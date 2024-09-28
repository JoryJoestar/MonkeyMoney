import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Settings',
        ),
      ),
    );
  }
}
