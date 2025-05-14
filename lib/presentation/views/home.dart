import 'package:flutter/material.dart';
import 'package:random_task_provider/constants/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyles.style32),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
