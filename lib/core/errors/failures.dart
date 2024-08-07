import 'package:keener_challenge/core/errors/failure.dart';

class GenericFailure extends Failure {
  const GenericFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(
          "You do not have an internet conection, please try again later.",
        );
}
