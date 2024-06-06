import 'package:bloc/bloc.dart';
import 'package:color_container_app/blocs/container_event.dart';
import 'package:color_container_app/blocs/container_state.dart';
import 'package:flutter/material.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState>{
  ContainerBloc(): super(ContainerState()){
    on<LeftTapEvent>(_left);
    on<RightTapEvent>(_right);
  }
  final List<Color> l_color = [Colors.red,Colors.blue,Colors.green,Colors.purple];
  final List<Color> r_color = [Colors.yellow,Colors.pink,Colors.brown,Colors.deepOrangeAccent];
  int leftColorIndex = 0;
  int rightColorIndex = 0;

  void _left(LeftTapEvent event, Emitter<ContainerState> emit){
    leftColorIndex = (leftColorIndex + 1) % l_color.length;
    emit(state.copyWith(left_color: l_color[leftColorIndex] ));
  }

  void _right(RightTapEvent event, Emitter<ContainerState> emit){
    rightColorIndex = (rightColorIndex + 1) % r_color.length;
    emit(state.copyWith(right_color: r_color[rightColorIndex]));
  }
}