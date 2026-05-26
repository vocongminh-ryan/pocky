import 'package:flutter/material.dart';
import 'package:pocky/features/counter/presentation/controllers/counter_controller.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.controller});

  final CounterController controller;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleCounterChanged);
  }

  @override
  void didUpdateWidget(CounterPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller == widget.controller) {
      return;
    }

    oldWidget.controller.removeListener(_handleCounterChanged);
    widget.controller.addListener(_handleCounterChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleCounterChanged);
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
        title: const Text('Pocky Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '${widget.controller.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
