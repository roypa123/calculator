part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class CalculatorInputEvent extends MainEvent {
  final String input;

  const CalculatorInputEvent(this.input);

  @override
  List<Object?> get props => [input];
}

class CalculatorClearEvent extends MainEvent {
  
  @override
  List<Object?> get props => [];
}

class CalculatorEqualsEvent extends MainEvent {
  
  @override
  List<Object?> get props => [];
}
