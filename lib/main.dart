import 'package:color_container_app/blocs/container_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_container_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: ColorContainerScreen(),
      ),
    );
  }
}
