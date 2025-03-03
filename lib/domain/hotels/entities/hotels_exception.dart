import 'package:equatable/equatable.dart';

sealed class HotelsException extends Equatable {
  const HotelsException();

  @override
  List<Object?> get props => [];
}

class UnknownHotelsException extends HotelsException {
  const UnknownHotelsException() : super();
}
