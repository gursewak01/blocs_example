import 'package:check_internet/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_internet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectionBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const CheckInternetScreen(),
      ),
    );
  }
}
