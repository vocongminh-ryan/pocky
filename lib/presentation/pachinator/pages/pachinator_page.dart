import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocky/presentation/pachin_navi/pages/pachin_navi_home_page.dart';

class PachinatorPage extends StatelessWidget {
  const PachinatorPage({super.key});

  static const routeName = 'pachinator';
  static const routePath = '/pachinator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pachinator')),
      body: Center(
        child: FilledButton.icon(
          onPressed: () => context.goNamed(PachinNaviHomePage.routeName),
          icon: const Icon(Icons.map_outlined),
          label: const Text('Back to Navi'),
        ),
      ),
    );
  }
}
