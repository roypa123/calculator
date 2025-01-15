import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  String _display = '0';
  double? _num1;
  double? _num2;
  String? _operation;

  MainBloc() : super(const CalculatorInitial('0')) {
    on<CalculatorInputEvent>(_onInputEvent);
    on<CalculatorClearEvent>(_onClearEvent);
    on<CalculatorEqualsEvent>(_onEqualsEvent);
  }

  Future<void> _onInputEvent(
      CalculatorInputEvent event, Emitter<MainState> emit) async {
    final input = event.input;
    if (['+', '-', '×', '÷','%'].contains(input)) {
      _num1 = double.tryParse(_display);
      _operation = input;
      _display = '';
    } else {
      if (_display == '0') {
        _display = input;
      } else {
        _display += input;
      }
    }

    emit(CalculatorResult(_display,_operation ?? ""));
  }

  void _onClearEvent(CalculatorClearEvent event, Emitter<MainState> emit) {
    _display = '0';
    _num1 = null;
    _num2 = null;
    _operation = null;
    emit(CalculatorInitial(_display));
  }

  void _onEqualsEvent(CalculatorEqualsEvent event, Emitter<MainState> emit) {
    _num2 = double.tryParse(_display);
    double? result;

    if (_num1 != null && _num2 != null) {
      switch (_operation) {
        case '+':
          result = _num1! + _num2!;
          break;
        case '-':
          result = _num1! - _num2!;
          break;
        case '×':
          result = _num1! * _num2!;
          break;
        case '÷':
          result = _num2! != 0 ? _num1! / _num2! : null;
          break;
        case '%':
          result = _num2! != 0 ? _num1! % _num2! : null;
          break;
      }
    }

    _display = result != null ? result.toString() : 'Error';
    emit(CalculatorResult(_display,_operation ??""));
  }
}
