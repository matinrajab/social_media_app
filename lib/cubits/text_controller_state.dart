import 'package:equatable/equatable.dart';

abstract class TextControllerState extends Equatable{
  const TextControllerState();

  @override
  List<Object?> get props => [];
}

class TextControllerEmpty extends TextControllerState {}

class TextControllerNotEmpty extends TextControllerState {}