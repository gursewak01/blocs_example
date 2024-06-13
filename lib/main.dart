import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/language/local_notifier.dart';
import 'counter_screen.dart';
import 'widgets/counter_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        //   BlocProvider(
        //   create: (context) => CounterBloc(),
        //   child: MaterialApp(
        //     title: 'Flutter Demo',
        //     home: CounterScreen(),
        //   ),
        // );

        MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),),
          ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<LocaleNotifier>(
          create: (_) => LocaleNotifier(),
        ),
      ],
      child: CounterScreen(),
    );
  }
}
