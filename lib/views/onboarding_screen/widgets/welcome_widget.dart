import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/onboarding3.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}
