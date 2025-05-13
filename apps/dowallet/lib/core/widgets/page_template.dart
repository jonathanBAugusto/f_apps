import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final Widget? body;
  const PageTemplate({super.key, required this.title, this.body});

  void _listPagesOnStack(BuildContext context) {
    final pages = GoRouter.of(context).routerDelegate.currentConfiguration;
    for (var page in pages.routes) {
      print(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () => _listPagesOnStack(context),
          ),
        ],
      ),
      body: body,
    );
  }
}
