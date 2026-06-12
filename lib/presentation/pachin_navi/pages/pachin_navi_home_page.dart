import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocky/common/repositories/counter_repository.dart';
import 'package:pocky/constants/app_spacing.dart';
import 'package:pocky/presentation/pachin_navi/controllers/pachin_navi_counter_controller.dart';
import 'package:pocky/presentation/pachinator/pages/pachinator_page.dart';

class PachinNaviHomePage extends StatefulWidget {
  const PachinNaviHomePage({super.key, required this.counterRepository});

  static const routeName = 'pachin-navi';
  static const routePath = '/';

  final CounterRepository counterRepository;

  @override
  State<PachinNaviHomePage> createState() => _PachinNaviHomePageState();
}

class _PachinNaviHomePageState extends State<PachinNaviHomePage> {
  late final PachinNaviCounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PachinNaviCounterController(widget.counterRepository)
      ..addListener(_handleCounterChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_handleCounterChanged)
      ..dispose();
    super.dispose();
  }

  void _handleCounterChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pachin Navi'),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(PachinatorPage.routeName),
            tooltip: 'Open Pachinator',
            icon: const Icon(Icons.people_alt_outlined),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${_controller.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
