import 'package:flutter/material.dart';
import 'package:pocky/app/app.dart';
import 'package:pocky/injection_container.dart';

void main() {
  configureDependencies();
  runApp(const PockyApp());
}
