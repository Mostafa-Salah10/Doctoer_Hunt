import 'package:doctor_hunt/core/enums/request_state.dart';
import 'package:equatable/equatable.dart';

class BoxState<T> extends Equatable {
  final T? data;
  final String? error;
  final RequestStates state;

  const BoxState({this.data, this.error, required this.state});

  const BoxState.initial()
    : this(state: RequestStates.initial, data: null, error: null);
  const BoxState.loading({T? data})
    : this(state: RequestStates.loading, data: data, error: null);
  const BoxState.error({String? error,T?data})
    : this(state: RequestStates.error, error: error, data: data);
  const BoxState.success({T? data})
    : this(state: RequestStates.success, data: data, error: null);

  bool get isLoading => state == RequestStates.loading;
  bool get isSuccess => state == RequestStates.success;
  bool get isError => state == RequestStates.error;
  bool get isInitial => state == RequestStates.initial;

  @override
  List<Object?> get props => [data, error, state];
}
