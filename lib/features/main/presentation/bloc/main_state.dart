part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends MainState {
  final String display;

  const CalculatorInitial(this.display);
}

class CalculatorResult extends MainState {
  final String result;

  const CalculatorResult(this.result);
}
