import 'package:equatable/equatable.dart';

abstract class PostControllerState extends Equatable{
  const PostControllerState();

  @override
  List<Object?> get props => [];
}

class PostControllerEmpty extends PostControllerState {}

class PostControllerNotEmpty extends PostControllerState {}