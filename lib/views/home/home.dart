import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.animationController});

  final AnimationController? animationController;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home',
        ),
      ),
    );
  }
}
