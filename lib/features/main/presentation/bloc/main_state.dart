part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends MainState {
  final String display;

  const CalculatorInitial(this.display);

  @override
  List<Object> get props => [display];
}

class CalculatorResult extends MainState {
  final String result;
  final String operation;

  const CalculatorResult(this.result,this.operation);

  @override
  List<Object> get props => [result,operation];
}
