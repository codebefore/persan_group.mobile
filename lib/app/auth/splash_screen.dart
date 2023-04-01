import 'package:flutter/material.dart';

import '../../core/component/base_screen.dart';
import '../../core/constant/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: baseScreen(
          context: context,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              Text(
                "Splash",
                style: themeTitleLarge(context),
              )
            ],
          ),
        ));
  }
}
