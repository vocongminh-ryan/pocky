import 'package:flutter/material.dart';
import 'package:pocky/features/counter/presentation/controllers/counter_controller.dart';
import 'package:pocky/features/counter/presentation/pages/counter_page.dart';
import 'package:pocky/injection_container.dart';

class PockyApp extends StatelessWidget {
  const PockyApp({super.key, this.counterController});

  final CounterController? counterController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocky',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CounterPage(
        controller:
            counterController ?? AppDependencies.instance.counterController(),
      ),
    );
  }
}
