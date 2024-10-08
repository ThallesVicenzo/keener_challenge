import 'package:equatable/equatable.dart';
import 'package:keener_challenge/core/errors/failure.dart';

abstract class PageState<S extends Object?> extends Equatable {
  bool get isSuccess => this is SuccessState;

  bool get isLoading => this is LoadingState;

  bool get isError => this is ErrorState;

  S get asSuccess => (this as SuccessState).data as S;

  Failure get asError => (this as ErrorState).error;

  @override
  List<Object> get props => [];
}

class InitialState<S extends Object?> extends PageState<S> {}

class LoadingState<S extends Object?> extends PageState<S> {
  final String? message;

  LoadingState({this.message});
}

class ErrorState<S extends Object?> extends PageState<S> {
  final Failure error;

  ErrorState({required this.error});
}

class SuccessState<S extends Object?> extends PageState<S> {
  final S data;
  SuccessState({required this.data});
}

class ShowInformation<S extends Object?> extends PageState<S> {
  final String message;

  // ignore: unused_element
  ShowInformation._private({
    required this.message,
  });

  // ignore: library_private_types_in_public_api
  factory ShowInformation.fromErrorState(ErrorState state, String? message) {
    return _ShowInfoErrorState<S>(
      error: state.error,
      message: message ?? state.error.message!,
    );
  }

  // ignore: library_private_types_in_public_api
  factory ShowInformation.fromSuccessState(
    SuccessState<S> state,
    String message,
  ) {
    return _ShowInfoSuccessState<S>(
      data: state.data,
      message: message,
    );
  }
}

class _ShowInfoSuccessState<S extends Object?> extends SuccessState<S>
    implements ShowInformation<S> {
  @override
  final String message;

  _ShowInfoSuccessState({
    required super.data,
    required this.message,
  });
}

class _ShowInfoErrorState<S extends Object?> extends ErrorState<S>
    implements ShowInformation<S> {
  @override
  final String message;

  _ShowInfoErrorState({
    required super.error,
    required this.message,
  });
}
