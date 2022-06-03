import 'package:equatable/equatable.dart';

abstract class ShareListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShareListLoad extends ShareListEvent {}
