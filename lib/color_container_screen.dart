import 'package:color_container_app/blocs/container_bloc.dart';
import 'package:color_container_app/blocs/container_event.dart';
import 'package:color_container_app/blocs/container_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorContainerScreen extends StatefulWidget {
  const ColorContainerScreen({super.key});

  @override
  State<ColorContainerScreen> createState() => _ColorContainerScreenState();
}

class _ColorContainerScreenState extends State<ColorContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Container App"),
      ),
      body: BlocBuilder<ContainerBloc, ContainerState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ContainerBloc>().add(LeftTapEvent());
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: state.left_color,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<ContainerBloc>().add(RightTapEvent());
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: state.right_color,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
