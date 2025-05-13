import 'package:dowallet/core/widgets/page_template.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Home',
      body: Container(alignment: Alignment.center, child: Text('Welcome Home')),
    );
  }
}
