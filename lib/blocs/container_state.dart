import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContainerState extends Equatable{
  final Color left_color, right_color;
  final List<Color> l_color = [Colors.red,Colors.blue,Colors.green,Colors.purple];
  final List<Color> r_color = [Colors.yellow,Colors.pink,Colors.brown,Colors.deepOrangeAccent];

  ContainerState(
    {this.left_color = Colors.red , this.right_color = Colors.blue}
  );

  ContainerState copyWith ({Color? left_color, Color? right_color}){
    return ContainerState(left_color:  left_color?? this.left_color, right_color:  right_color?? this.right_color);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [left_color, right_color];

}