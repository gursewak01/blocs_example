import 'package:equatable/equatable.dart';

abstract class ContainerEvent extends Equatable{
  ContainerEvent();
  List<Object> get props => [];
}

class LeftTapEvent extends ContainerEvent{}

class RightTapEvent extends ContainerEvent{}
