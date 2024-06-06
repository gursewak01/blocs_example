import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter App (Gursewak)"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                }, child: Text("Increment")),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: Text("Decrement")),
              ],
            ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: () {
              context.read<CounterBloc>().add(ResetCounter());
            }, child: Text("Reset"))
          ],
        ),
      ),
    );
  }
}
