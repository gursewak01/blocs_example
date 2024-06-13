import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:counter_app/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  Widget build(BuildContext context) {
    //defining the instance of CounterBloc in root, so that all the other widgets can access it
    //(without the need to create their own instance).
    final counterBloc = Provider.of<CounterBloc>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('es'), 
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          title: Builder(
            builder: (context) {
              return Text(AppLocalizations.of(context)?.appTitle??'');
            }
          ),
          actions: [
            IconButton(
              icon: Icon(themeNotifier.isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                themeNotifier.toggleTheme();
              },
            ),
          ],
        ),
        body: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            print("listened");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('English'),
                onPressed: () {
                },
              ),
              BlocBuilder<CounterBloc, CounterState>(
                bloc: counterBloc,
                builder: (context, state) {
                  return Center(
                      child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60),
                  ));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // context.read<CounterBloc>().add(IncrementCounter());
                        counterBloc.add(IncrementCounter());
                      },
                      child: Text("Increment")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // context.read<CounterBloc>().add(DecrementCounter());
                        counterBloc.add(DecrementCounter());
                      },
                      child: Text("Decrement")),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    // context.read<CounterBloc>().add(ResetCounter());
                    counterBloc.add(ResetCounter());
                  },
                  child: Text("Reset")),
              SizedBox(
                height: 30,
              ),
              Text("You have pressed button this many times: "),
              BlocSelector<CounterBloc, CounterState, int>(
                  selector: (state) => state.counter,
                  builder: (context, counter) {
                    return Text("$counter");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
