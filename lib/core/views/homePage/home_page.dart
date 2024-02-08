import 'package:flutter/material.dart';
import 'package:testingprojectone/common/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAppbar(showBackButton: false),
    );
  }
}
