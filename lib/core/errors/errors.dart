import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String message;

  const Failure(this.message);

  factory Failure.fallback() {
    return const Failure("Something went wrong!");
  }

  @override
  List<Object?> get props => [];
}

class InternetConnectionFailure extends Failure {
  const InternetConnectionFailure(
      {String message = "Please check your internet connection!"})
      : super(message);
  @override
  List<Object?> get props => [];
}

class NoDataFailure extends Failure {
  const NoDataFailure(String message) : super(message);
  @override
  List<Object?> get props => [];
}

class ResponseNot200Failure extends Failure {
  final dynamic body;
  final int code;
  const ResponseNot200Failure({message, required this.code, required this.body})
      : super(message);
  @override
  List<Object?> get props => [];
}
