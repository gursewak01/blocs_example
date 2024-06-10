import 'package:check_internet/bloc/internet_bloc.dart';
import 'package:check_internet/bloc/internet_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInternetScreen extends StatefulWidget {
  const CheckInternetScreen({super.key});

  @override
  State<CheckInternetScreen> createState() => _CheckInternetScreenState();
}

class _CheckInternetScreenState extends State<CheckInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Internet Connection check"),),
        body: Center(
        child: BlocBuilder<ConnectionBloc, ConnectionState>(
          builder: (context, state){
            return Text(state.isConnected ? 'Connected to Internet': 'No Internet');
          },
        ),
                  ),
      ),
    );
  }
}