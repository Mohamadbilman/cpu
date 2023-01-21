import 'package:bloc/bloc.dart';
import 'package:cpu/modules/advertisement_screen/advertisement.dart';
import 'package:cpu/shared/component/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Advertisement_Screen(),
    );
  }
}
